# Getting started on Jetstream

## Initializing the Jetstream environment.
  1. Head to Jetstream: https://use.jetstream-cloud.org
  1. Log into Jetstream using your XSEDE user credentials.
  1. From the "Projects" tab, create a new project by clicking the "Create new project" button.
      * Use a project name that will be unique among your project.
      * Include a few words as a project description.
      * Click "Create".
  1. Select the desired project from the "Projects" tab.
  1. Create a new instance for the project.
      * Under the "Resources" tab for the project, click "New" and select "Instance" from the resulting drop-down menu.
      * Search for `Ubuntu 14.04.3 Development GUI` and click to select.
      * If desired, rename the instance to something more informative.
      * Add bash setup script to the instance:
          * Click "Advanced Options".
          * Select "Create a new script".
          * Into the "Script URL" box, paste `https://raw.githubusercontent.com/aculich/jetstream-setup/master/jetstream-setup.sh`
              * This includes setup for terminal multiplexer, latest version of Docker, and other helpful information
          * Give it a useful name.
          * Click "Save and add script".
          * Click "Continue to launch".
      * Check to make sure that the correct allocation source, provider, and instance size are specified.
      * Click "Launch instance".
  1. Create a new volume for the project.
      * Under the "Resources" tab for the project, click "New" and select "Volume" from the resulting drop-down menu.
      * Check to make sure that the provider is **identical** to the provider you specified for the instance.
      * Give it a useful name.
      * Update the volume size.
      * Click "Create Volume".
  1. Wait for instance to be ready.
      * Jetstream will send an email notification to you when your instance is ready to use.
