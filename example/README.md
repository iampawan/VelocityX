# VelocityX Example Application

Welcome to the VelocityX example application. This application is designed to showcase the capabilities of the VelocityX library, a minimalist Flutter framework that helps you build applications rapidly. It uses VelocityX for state management (VxState), UI extensions, and more.

## Application Overview

The application is a simple user management system. It uses `VxState` for state management, which allows us to manage the state of our application in a predictable way. The UI is built using various VelocityX extensions, which provide a wide range of pre-styled widgets and utility functions for building responsive layouts.

## Running the Application

This project uses Melos to manage scripts for building, testing, and analyzing the code. Here are some of the scripts you can run:

- **Build**: To build the application, run the following command in your terminal:

```sh
melos run build
```

- **Analyze**: To analyze the dart code:

```sh
melos analyze
```

- **Format**: To format the code:

```sh
melos format
```

- **Build**: To run flutter tests (including goldens test):

```sh
melos test
```

- **Run all** To run all of these (think CI machine, [build, format, analyze, test]):

```sh
melos all
```

## Application Structure

The application is structured as follows:

- lib/main.dart: This is the entry point of the application.
- lib/data: This directory contains the data models and related code. For example, user.dart defines the User model.
- lib/mutations: This directory contains the mutations, which are functions that encapsulate changes to the state of the application. For example, get_user.dart defines a function for fetching a user.
- lib/pages: This directory contains the pages of the application. Each page is a separate widget. For example, home_page.dart defines the home page of the application.
- lib/stores: This directory contains the stores, which manage the state of the application.
- test: This directory contains the tests for the application.

We hope you find this example application useful as a starting point for your own VelocityX projects. Happy coding!

