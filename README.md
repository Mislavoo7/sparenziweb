# Sparenzi Web
This is an example app, a showcase project. It is a Ruby on Rails application that enables users to track their daily expenses while shopping for groceries. 

## Content
This app includes:
- Admin CMS for managing admins, users, and pages.
- User dashboard – people can create accounts and log in to their profiles. There is no email confirmation because I didn’t want to set up MailGun or SendGrid.
- Public pages that explain how the app works.
- API that connects to a React Native (Expo) app.

There are two models that use the [Devise gem](https://github.com/heartcombo/devise):
- Admins: They can log in to the CMS (sign-up is disabled, but other admins can add them).
- Users: They can sign in and access the user dashboard, where they manage their lists.

For the frontend, I used Tailwind CSS, and for dynamic features like sorting and filtering, I used Stimulus JS.

## Translations
This app supports three languages: Croatian, German, and English. Each translatable model has a `[model_name]_translation` table (e.g., `page_translations`) with fields that should be translated, such as `title`, `description`, and `tagline`. The table also contains `[model_name]_id` (for example, `page_id: integer`) to link it to the non-translatable model, and a `locale` column that stores `"en"`, `"de"`, or `"hr"`.

## Scalability
Admins can add as many pages as they like and can also add sections to those pages. These pages will be public and contain information about the project.

## Core Functionality
Users who register can create lists, and within those lists, they can add products.  
- Products have fields like `price`, `name`, and `brand`.  
- Lists have fields like `taken_at` (datetime) and `currency`.  

The user can set a preferred currency in their settings, but a list’s currency can differ from the user’s default. In the end, the user gets an overview of all their expenses.

## API
There is a separate repository for a React Native (Expo) app that connects to this Rails backend. Through it, users can:  
- Register and log in  
- Add products and lists  
- Set their preferred language  
- Switch between light or dark theme  
- Choose their preferred currency (€ or $)  
- Read the contents of the legal pages.

## Live
The app is on Hetzner server where I installed Ubuntu 24, ngnx and puma.
[Here you can find my RoR Sparenzi web](https://sparenzi.eu/)





