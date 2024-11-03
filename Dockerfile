# Use the official Ruby image as a base
FROM ruby:3.2.5

# Install dependencies
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash
RUN apt install nodejs

# Set working directory
WORKDIR .

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile* .

# Install bundler and gems
RUN gem install bundler && bundle install

# Copy the rest of the application code
COPY . .

# Build the Jekyll site
RUN npm i
RUN bundle exec jekyll build

# Set environment variable to production
ENV JEKYLL_ENV=production

