# Use the official Ruby image as a base
FROM ruby:3.2.5

# Install dependencies
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -  # Add NodeSource repository for Node.js 16
RUN apt install nodejs
RUN npm install

# Set working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile* ./

# Install bundler and gems
RUN gem install bundler && bundle install

# Copy the rest of the application code
COPY . .

# Build the Jekyll site
RUN bundle exec jekyll build

# Set environment variable to production
ENV JEKYLL_ENV=production

# Expose the port Jekyll will run on
EXPOSE 4000

# Command to serve the site
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000"]
