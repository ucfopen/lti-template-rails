[![Join UCF Open Slack Discussions](https://ucf-open-slackin.herokuapp.com/badge.svg)](https://ucf-open-slackin.herokuapp.com/)

# LTI Template For Ruby on Rails

## ⚠️ Support Warning ⚠️

This template is currently unsupported by UCF. We are looking for maintainers. Please [contact us](#contact-us) if you're interested in taking over this project; we'll gladly link out to your fork.

## Setup

1. Make sure [Ruby is installed](https://www.ruby-lang.org/en/documentation/installation/) `ruby --version`
2. Install Bundler with `gem install bundler`
3. Change directory into the Rails app's root directory `cd template`.
4. Install all the gems listed in the Gemfile using the simple command: `bundle`
5. Create `template/config/lti_settings.yml` by copying the template `template/config/lti_settings.yml.template`
6. Create `template/config/secrets.yml` by copying the template `template/config/secrets.yml.template`.

## Starting The Server

Our basic template requires no database or models, so we'll skip all that jazz here.

7. Start the development server `bin/rails server`
8. Visit [http://localhost:3000](http://localhost:3000) in your browser and test!
9. Test your xml and test adding your LTI. Rails does a lot of black magic!


## Install LTI into an LMS, Etc.

- You'll need the LTI XML config url, matching consumer key, and secret from your `lti_settings.yml` file ready.
- Navigate to the course that you would like the LTI to be added to. Click Settings in the course navigation bar. Then, select the Apps tab. Near the tabs on the right side, click 'View App Configurations'. It should lead to a page that lists what LTIs are inside the course. Click the button near the tabs that reads '+ App'.
- A modal should come up that allows you to customize how the app gets added. Change the configuration in the Configuration Type dropdown menu to 'By URL' or 'Paste XML' depending on how you have your LTI configured. If your LTI is publicly accessible, 'By URL' is recommended. From there, fill out the Name and Consumer Keys, and the Config URL or XML Configuration. Click Submit.
- Your LTI will appear depending on specifications in the XML. Currently, they get specified in the **options** tag within the **extensions** tag. Extensions can include these options:
    - Editor Button (visible from within any wiki page editor in Canvas)
    - Homework Submission (when a student is submitting content for an assignment)
    - Course Navigation (link on the lefthand nav)
    - Account Navigation (account-level navigation)
    - User Navigation (user profile)

**Note**: If you're using Canvas, your version might be finicky about SSL certificates. Keep HTTP/HTTPS in mind when creating your XML and while developing your project. Some browsers will disable non-SSL LTI content until you enable it through clicking a shield in the browser bar or something similar.

## Contact Us

Join us on the [UCF Open Slack](https://ucf-open-slackin.herokuapp.com/) and use the `#lti` channel.
