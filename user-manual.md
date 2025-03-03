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

The purpose of this document is to provide Hiking Band's users the required information to successfully setup and use the Hiking Band system. The system consists of two applications: the Raspberry Pi Web Application and LilyGO T-watch smartwatch hiking application. This document contains a section for each application and a section for communication between applications.  

A test plan has been included for both applications for the purpose of detailing to QA specialists how it can be verified that the application works as intended. Additional information for testing can be found from the SRS documentation. Please keep in mind, that the SRS may contain optional features that have not been implemented in the proof-of-concept version. All non-optional features listed in SRS SHOULD be available and optional features MAY be available. 



# LilyGo T-Watch Hiking application

The LilyGo T-Watch Hiking application is a proof-of-concept (later in this section PoC) smartwatch application for tracking hiking trips. The application uses LilyGo T-Watches BMA423 accelerometer to track step count and LilyGo T-Watches M8/M6 GPS Module. Average speed is computed by recording the start time of the hike and calulating average speed from tracked distance and hike duratoin.  Users can also view information from past hikes and configure Bluetooth synchronization from the settings menu. 

Some introductory words here. 


## Requirements 

Before getting started, make sure that you have the following hardware components:

- LilyGO T-Watch V2
- A Linux or Windows machine
- A USB-A to micro-USB cable

> The LilyGo hiking application officially supports V2 of the LilyGo T-Watch smartwatch. Additionally the application MAY also work on V3 with configuration changes, but V3 is not officially supported. 


## Installation and setup

### Arduino-cli and esp32 libraries

1. Install arduino-cli:

https://arduino.github.io/arduino-cli/1.1/

2. Install esp32 libraries

```console
arduino-cli core update-index --config-file arduino-cli.yaml

arduino-cli core install esp32:esp32@2.0.14

python3 -m pip install pyserial
```

3. Test your board

```console
arduino-cli board list

Port         Protocol Type              Board Name FQBN Core
/dev/ttyUSB0 serial   Serial Port (USB) Unknown
```

### Compilation and upload to esp32

Use the following table to make your compilation:

|  Device                |    Board/FQBN              |
| ---------------------- | -------------------------- |
| ESP32_WROOM_32         |  esp32:esp32:esp32-poe-iso |
| LILYGO_WATCH_2020_V2   |  esp32:esp32:twatch        |
| LILYGO_WATCH_2020_V3   |  esp32:esp32:twatch        |

For example for TWATCH V3:

```console
DEVICE="LILYGO_WATCH_2020_V3"
FQBN=esp32:esp32:twatch
arduino-cli compile --fqbn $FQBN --build-path $(pwd)/build --build-property "build.extra_flags=-D $DEVICE -D ESP32" .
arduino-cli upload -p /dev/ttyUSB0 --fqbn esp32:esp32:esp32-poe-iso --input-dir $(pwd)/build .
```

or 

configure config.ini 

```console
./install.sh
```


### Debugging

Add read and write access to usb device:

```console
chmod 777 /dev/ttyUSB0
```

Read the serial:

```console
picocom -b 115200 /dev/ttyUSB0
or
putty
or
screen /dev/ttyUSB0 115200
```



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

The web application and the installation and run scripts have been built on a Linux based Operating System. It is recommended to use the application on a Linux based Operating System.  

The minimum Python version is 3.10. Versions for dependencies are listed in requirements.txt. Use of virtual environment is adviced, as detailed below in installation instructions. 

## Installation and setup

These instructions assume that the user is using a Linux based Operating System with a bash terminal emulator. 

### Manual installation

First setup the virtual environment

```bash
python3 -m venv venv
```

Then install dependencies

```bash
pip install -r requirements.txt
```

If you add new dependencies, create an updated `requirements.txt` with the following command:
```
pip freeze > requirements.txt
```

### Convenience script

Run the installation script with

```bash
./install.sh
```

## Running the application

### Manually

To run the app use 

```bash
flask --app src/app.py run
```

To debug:

```bash
flask --app src/app.py --debug run
```


### Convenience script

To run the app use 

```bash
./start-app.sh
```

To debug:

```bash
./start-app.sh debug
```


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



