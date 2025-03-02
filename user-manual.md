---
title: "Hiking Band: User Manual"
author: 
- name: Holappa, Heidi 
- name: Lundén, Jaakko-Juhani
- name: Rislakki, Tuomas
abstract: ELEC-E8408 Embedded Systems Development, Aalto University. Group I.
lang: en
format: gfm
header-includes:
  - \usepackage{caption}
  - \captionsetup[figure]{font=scriptsize}  # This sets the font size for figure captions.
numbersections: true
toc: true
toc-depth: 2
# To render document use `quarto render user-manual.md --to pdf`
---




# Introduction

- The purpose of the document
- The content


# LilyGo T-Watch Hiking application

Some introductory words here. 


## Requirements 

The LilyGo hiking application officially supports V2 of the LilyGo T-Watch smartwatch. Additionally the application MAY also work on V3 with configuration changes, but V3 is not officially supported. 


## Installation and setup

## Tutorial

## Test plan

At this proof-of-concept stage the, test plan relies on manual testing. The functional requirements of the smart watch detailed in the SRS documentation can all be tested manually. A comprehensive list of testable features have been collected to the following subsections. These collections should assist the QA specialists in implementing suistable tests to verify that the functionalities work as intended. 

### Navigation

- User can navigate from main view to
  - sessions view
  - past sessions view
  - settings view
- user can navigate back to main view from all other views


### Session view

- When user presses start - button
  - applicatin begins tracking user's movement
  - the following session data is displayed on the view
    - step count
    - distance
    - average speed
  - the start button turns red and the button text changes to "stop"
- When user presses stop - button
  - applicatin stops tracking user's movement
  - the stop button turns blue and the button text changes to "start"


### Past sessions view

- The past session view contains information on stored sessions. 
- For each session the following information is shown:
  - date of the session
  - travelled distance
  - average speed


### Settings view

- TODO





# Raspberry Pi Web Application

Some introductory words here. 

## Requirements 

## Installation and setup

## Tutorial 


## Test plan

At this proof-of-concept stage the, test plan relies on manual testing. A comprehensive list of testable features have been collected to the following subsections. These collections should assist the QA specialists in implementing suistable tests to verify that the functionalities work as intended. 

### Main view

- The main view contains navigation buttons to hikes view and configuration view
- The main view additionally contains some key information from past sessions:
  - The last recorded session
  - The session with longest travelled distance
  - The session with fastest average speed
  - Averages for step count, distance, average speed and burned calories all sessions


### Hikes view

- The hikes view contains a table of past hikes
    - data is correctly shown in the table
    - data with missing values is displayed correctly
    - empty table is displayed correctly 
- Each row contains the following information
  - id 
  - date
  - step count
  - distance
  - average speed
  - burned calories
- additionally each row contains a Delete button from which the selected entry can be deleted
  - pressing the delete button activates a modal in which user is asked to confirm deletion
  - after confirmation, entry is deleted and the hikes-view is re-rendered

### Configuration view

- TODO 


# Communication between devices



