---
layout: post
title: "Building a Simple Website Using Jekyll"
date: 2024-10-15
categories: technology
tags: [jekyll, static site, web development, ruby]
image: https://modernweb.com/wp-content/uploads/2013/10/jekyll_header.jpg
---

# Jekyll Setup Guide for Windows

## Table of Contents
1. [Introduction to Jekyll](#introduction-to-jekyll)
2. [System Requirements](#system-requirements)
3. [Step 1: Install Ruby](#step-1-install-ruby)
4. [Step 2: Install Jekyll and Bundler](#step-2-install-jekyll-and-bundler)
5. [Step 3: Create a New Jekyll Site](#step-3-create-a-new-jekyll-site)
6. [Step 4: Run the Jekyll Server](#step-4-run-the-jekyll-server)
7. [Step 5: Explore Jekyll Templates](#step-5-explore-jekyll-templates)
8. [Step 6: Deploy to GitLab Pages](#step-6-deploy-to-gitlab-pages)
9. [Additional Resources](#additional-resources)

---

## Introduction to Jekyll
Jekyll is a static site generator, great for blogs and personal sites. It converts Markdown into a complete website without the need for a backend server, making it fast and secure.

## System Requirements
- **Operating System**: Windows 10 or later
- **Ruby**: Version 2.5 or higher
- **DevKit** (Development Kit) for Windows to build native extensions

## Step 1: Install Ruby

1. Download the latest RubyInstaller for Windows from [RubyInstaller Downloads](https://rubyinstaller.org/downloads/).
2. Run the installer and select the option to install the MSYS2 development toolchain, which is required for building Jekyll.
3. After installation, open a new command prompt and verify Ruby by running:
    ```bash
    ruby -v
    gem -v
    ```
4. This command should show the installed Ruby and Gem versions.

## Step 2: Install Jekyll and Bundler

1. Open a command prompt.
2. Install Jekyll and Bundler gems with:
    ```bash
    gem install jekyll bundler
    ```
3. Verify the installation by running:
    ```bash
    jekyll -v
    ```

## Step 3: Create a New Jekyll Site

1. In the command prompt, navigate to the directory where you want your site’s files.
    ```bash
    cd path\to\your\directory
    ```
2. Create a new Jekyll site with:
    ```bash
    jekyll new my-awesome-site
    ```
3. Change into the site directory:
    ```bash
    cd my-awesome-site
    ```

## Step 4: Run the Jekyll Server

1. Build the site and start a local server:
    ```bash
    bundle exec jekyll serve
    ```
2. Open a web browser and go to `http://localhost:4000` to view your new site.
3. To stop the server, press `Ctrl + C` in the command prompt.

## Step 5: Explore Jekyll Templates

Enhance your Jekyll site with themes. Here are some popular templates:

- **Minima (default theme)**:
  - Repository: [GitHub - Minima](https://github.com/jekyll/minima)
  - To use Minima, add it to your `Gemfile`:
    ```ruby
    gem "minima"
    ```
  - And update your `_config.yml`:
    ```yaml
    theme: minima
    ```
  
- **Beautiful Jekyll**:
  - Repository: [Beautiful Jekyll](https://github.com/daattali/beautiful-jekyll)
  - Download and follow setup instructions from the repository.

- **Jekyll Now**:
  - Repository: [Jekyll Now](https://github.com/barryclark/jekyll-now)
  - This template makes setup simple, with a lot of pre-configured options.

- **Minimal Mistakes**:
  - Repository: [Minimal Mistakes](https://github.com/mmistakes/minimal-mistakes)
  - This theme is packed with features, perfect for personal blogs or portfolios.

To apply any of these themes, follow the instructions in their repositories. Usually, you’ll need to add the theme’s repository as a remote or clone the theme directly.

## Step 6: Deploy to GitLab Pages

1. **Create a GitLab Repository**:
   - Go to [GitLab](https://gitlab.com/) and create a new project.
   - Clone the repository to your local machine or initialize a new Git repository in your Jekyll project folder.

    ```bash
    git init
    git remote add origin https://gitlab.com/your-username/your-repository.git
    ```

2. **Add a `.gitlab-ci.yml` File**:
   - In your Jekyll project’s root directory, create a `.gitlab-ci.yml` file with the following content:

    ```yaml
    image: ruby:latest

    variables:
      JEKYLL_ENV: production

    cache:
      paths:
        - vendor/ruby

    before_script:
      - bundle install

    pages:
      script:
        - JEKYLL_ENV=production bundle exec jekyll build
        - mkdir -p public/fw0502
        - cp -r ./Module-FW05/Bootcamp-FW0502/_site/* public/fw0502

      artifacts:
        paths:
          - public
      only:
        - main
    ```

    Make sure you add script to build javascript resources if your chosen template uses bootstrap

    - This configuration file tells GitLab CI/CD to use a Ruby image, install the required dependencies, build the Jekyll site, and serve the `public` directory as your GitLab Pages site.

3. **Edit `_config.yml` File**:

  - In your config file, edit the following

  ```yaml
    url: "https://kiwanda.gitlab.io"

    baseurl: "/repo-name/fw0502"
  ```

4. **Push Your Code to GitLab**:
    ```bash
    git add .
    git commit -m "Initial commit for Jekyll site"
    git push -u origin main
    ```

5. **View Your Site**:
   - After pushing, GitLab CI/CD will build and deploy your site. You can check the status under **CI/CD > Pipelines** in your GitLab project.
   - Once completed, your site will be available at `https://kiwanda.gitlab.io/repo-name/fw0502/`.

## Additional Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/) - Official Jekyll docs
- [GitLab Pages Documentation](https://docs.gitlab.com/ee/user/project/pages/) - Full documentation on deploying GitLab Pages
- [GitHub Pages Guide](https://docs.github.com/en/pages) - Host your Jekyll site for free with GitHub Pages
- [Markdown Guide](https://www.markdownguide.org/) - Learn more about Markdown syntax

---

Happy building with Jekyll!
