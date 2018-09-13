# HTTP Response

Simple script at this point, provide an http address in the format required and receive the http resposne code. Currently no rescue or error trappings, you send something other than an http address in format: http://google.com you will error out. Rough draft status, use at own risks.

## Purpose

Heroku Free Dyno goes to sleep after 30 minutes, using this script will allow you to keep it awake with Cron or Rails using Sidekiq. Also you can design and implement a dashboard with Rails detailing and displaying status responses from websites you want to monitor.

## Features:

- [x] Submit HTTP address, receive HTTP response code back
- [ ] Accept HTTP & HTTPS
- [ ] Error checking and rescue
- [ ] Accept flat file of HTTP addresses
- [ ] Cron friendly
- [ ] Sidekiq ready
