# Course notes


## Introduction

The purpose of this documentation is to gather notes from lecture and course reading that may be of use during the course mini-project or when preparing for the course exam. 


## Validation and verification

> Validation: are we building the right product
> Verification: are we building the product right

## Formal and semi-formal methods

## Software Engineering Principles (Seven principles)

1. **Coincidental.** Parts of a module are not related at all, but simply bundled into a single module.
2. **Logical.** Parts that perform similar tasks are put together in a joint module.
3. **Temporal.** Tasks that execute within the same time span are brought together.
4. **Procedural.** The elements of a module make up a single control sequence.
5. **Communicational.** All elements of a module act on the same area of a data structure.
6. **Sequential.** The output of one part in a module serves as input for another part.
7. **Functional.** Each part of a module is necessary for the execution of a single function.



## Life Cycle Models 

- Waterfall
- V-Model
- Spiral Model
- Agile



## OOP, procedural programming and Design Patterns


### OOP

- Dependency injection
- Modularity

### Procedural programming


### Differences between OOP and procedural programming


### Design Patterns

#### Singleton Pattern

#### Observer Pattern



## Software Design Approaches

> Definition of 'design': The process of defining the architecture, components, interfaces, and other characteristics of a system (IEEE Std 100-2000). 

During the software design phase decisions are made concerning: 
- responsibility assignment and fullfillmenta
- system architecture and deployment, 
- separation of concerns
- layering and modularization


Laplante also notes that computational algorithms and their numerical precision are specified in the design document. The opportunity of design reuse should also be a consideration.  

Laplante argues, that the software design phase takes approximately the same amount of resources (in person months) as the requirements-engineering and programming phases **together**

> Signifying that software design is a time consuming phase!

### Qualities of Real-time software

**External qualities**
- observable by the user
- of explicit interest to the end user
- examples:
  - performance
  - usability

**Internal qualities**
- not observable by the end user
- aid the software developpers to achieve certain improvement in **external qualities**
- example
  - quality design documentation improves development process 


**Eight qualities by Laplante**
- **reliability:** a measure of whether a user can depend on the software
  - common characterizations:
    - the system "stands the test of time"
    - there is an absence of known errors that render the system uselesss
    - the system recovers "gracefully from errors"
    - the software is robust
  - in ERTS: 
    - downtime is below a specified threshold
    - the accuracy of the system remains within a certain tolerance
    - real-time performance requirements are met consistently
  - Laplante notes that these are difficult to measure
  - Additionally it is unrealistic to expect a system to never to fail, there is always a probability of failure. See p. 269-270 for a equation and an example. 






## References

P. A. Laplante & S. J. Ovaska Real-Time Systems Design and Analysis: Tools for the Practitioner Softcopy of the book chapters can be found in MyCourses (You need to be in Aalto network or connected via Aalto VPN to download it for free) Chapter 5-9

Systems Engineering Body of Knowledge: https://sebokwiki.org/w/images/sebokwiki-farm!w/5/5c/Guide_to_the_Systems_Engineering_Body_of_Knowledge_v2.11.pdf 

IEEE 830:1998 IEEE Recommended Practice for Software Requirements Specifications: https://ieeexplore.ieee.org/document/720574

ISO/IEC/IEEE 29148-2011 International Standard - Systems and software engineering -- Life cycle processes -- Requirements engineering: https://ieeexplore.ieee.org/document/6146379


