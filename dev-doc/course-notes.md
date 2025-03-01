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
    - The equation 6.2 has an interesting approach => failure intensity is higher in early stages of software, and lower in later stages (such as maintenance stage). 
    - Figure 6.2 highlights an other model useful for ERTSs, a bathtub model. Failure increase in later stages is caused by hardware failures. What cold lead to a bathtub-curve with software failure intensity? Explanations
      1. failures caused by patching (hotfixes done without adequate design and testing)
      2. failures cause by hardware degradation
      3. experienced users put more strain on advanced feature and begin to use previously unsused features. Dormant undetected bugs may emerge.
- **correctness**
  - fundamental difference to reliability is that even a minor deviation from the requirements is strictly considered a failure and hence means the software is incorrect. 
  - incorrect software may still be reliable! 
  - in RTS correctness incorporates both correctness of outputs as well as deadline satisfaction
- **performance**
  - explicit measure of some required behaviour
  - common approach based on computational complexity theory
  - most accurate approach involves directly timing the behaviour of the completed system (with logic analyzer or performance analysis tools)
- **usability**
  - ease of use or user friendliness
  - a measure of how easy and comfortable the software is fo rhumans to use
  - an elusive definition, difficult to quantify
  - usability for a novice may differe vastly from usability to expreienced user 
  - demonstrative prototyping can be used to increase the usability
- **interoperability**
  the ability of the software to coexist and cooperate with other relevant software
  - especially important for 
    - component based software development
    - software reuse
    - network-based software systems
  - usually straightforward to achieve if decision to communicate is made before software is designed
  - much more laborious to attain after software has been designed
  - example: in real-time applications, the software must be able to communicate with various devices using standard bus structures and protocols. 
  - **related concept: open system**
    - an extensible collection of independently written application that cooperate to function as an integrated systems
    - follows open standards for interoperatbility
    - ensures compability and flexibility
- **maintainability**
  - related to the anticipation of change that should guide the software engineer throughout the development project
  - A software system in which changes are relatively easy to make has a high level of maintainability
    - connected directly to 
      - the readability and understandability of the program code
      - associated documentation
  - in a long run design for software change 
    - reduces life cycle costs
    - improves quality and reputation of manufacturer
- **portability**
  - how easily the software can be made to run in different environments (hw platforms)
  - because of I/O intensive hardware with which the SW closely interacts, special attention must be taken with Embedded Systems to make it portable
  - hardware portability achieved through a delibirate design strategy
    - hardware-dependent code is confined to the fewest code units as possible (e.g. device drivers)
    - works with procedural and OOP languages by using structures and object-oriented design approaches
  - with ERTSs some standard application program interface (API) is adopted (drawback: potential overhead)
- **verifiability**
  - degree to which various qualities, including all of those previously introduced, can be verified
  - in RTS, verifiability of deadline satisfaction is of the utmost importance
  - one technique
    - insertion of special program code that is intended to monitor certain qualities, such as performance correctness
  - essential throughout the whole software life cycle. 
    

**Software Qualities and Possible Means for Measuring them**

| Software Quality > Possible Measuerment Approach |
| --- | --- |
| Reliability | Probabilistic measures, MTFF, MTBF, heuristic measures |
| Correctness | Probabilistic measures, MTFF, MTBF |
| Performance | Algorithmic complexity analysis, simulation, direct measurement |
| Usability | User feedback from surveys and problem reports |
| Interoperability | Compliance with relevant open standards |
| Maintainability | Anecdotal observation of resources spent |
| Portability | Anecdotal observation of resources spent |
| Veriﬁability | Insertion of special monitoring code |


### Software Engineering Principles

- Software engineering does not share similar theoretical foundation to older engineering disciplines 
  - software development is a creative human activity related to problem solving
- In Software engineering there are several fundamental rules that form the basis of sound practices


### Sever principles from Rigor and Formality to Traceablity

- **rigor and formality**
  - rigor requires the use of mathematical techniques
  - formality is a higher form of rigor
    - precise, unabiguous
  - RTS example:
    - strict formality  would require that there be an underlying algorithmic approach to the specification, design, coding and documentation of the software
    - because of the inherent difficulty in achieving this, semiformal and informal approaches are needed to complement individual formal approaches. 
- **separation of concerns**
  - divide-and-conquer strategy to manage miscellaneous problems related to complexity
  - in terms of design and coding it is used in object-oriented design and in modularization of procedural code
  - there may be sepration in time (e.g. predefined scheduling of tasks)
  - one form is in dealing with individual software qualities (e.g. addressing fault tolerance separately)
    - it is important to keep in mind that in SW many qualities are interrelated
    - improving one may deteriorate other qualities
- **Modularity**
  - commonly achieved by grouping together logically related elements
    - statements
    - procedures
    - variable declarations 
    - object attributes
  - involves decomposition of software behaviour in encapsulated software units
  - can be achieved with both procedural and OO languages
  - the goal is high cohesion and low coupling
  - Seven levels of cohesion (Constantine and Yourdon):
    1. Coincidental
    2. Logical
    3. Temporal
    4. Procedural
    5. Communicational
    6. Sequential
    7. Functional
  - low coupling: lower ripple effect on errors
  - six levels of coupling (with increasing strength)
    1. None. All modules are unrelated. 
    2. Data. Every argument is either a simple argument or data structure in which all elements are used by the called module
    3. Stamp. Data structure is passed to a module, but DS is only partially used. 
    4. Control. One module explicitly controls the logic of the other by passing an element of control to it. 
    5. Common. Two modules have access to the same global data. 
    6. Content. One module directly references the contents of another. 
- **anticipation of change**
  - software products are subject to frequent change
  - high maintainability level is crucial
  - embedded systems:
    - anticipation of change can be achieved by adopting a suitable life cycle model and corresponding design methodologies
- **Incrementality**
  - software developed in incerements
    - each increment provides additional functionality
    - product can be demonstrated to customer in the end of each increment
- **Traceability**
  - regarding both documentatin and code (version control)
  - can coding decisions be traced back to design decision? This should be possible!
  - especially important in embedded systems:
    - coding decisions often related to specific hardware constraints. 
  - important links:
    - from requirements to stakeholders who proposed the requirements
    - between dependent requirements
    - from the requirements to the design
    - from the design to associated code segments
    - form the requirements to the test plan
    - from the test plan to individual test cases
  - Note: see traceability matrix example (Table 6.3, page 281)


### Design activity

The design activity is involved in
- identifying the components of the software design and
- their interfaces from SRS

Principal artifact of this activity is the Software Design Description (SDD). The standard IEEE Std 1016-2009. The standard defines that

> SDD is a representation of a software design that is to be used for recording design information, addressing various design concerns, and communication that information to the design's stakeholders. 

During the design phase, detailed SDD is created and formally accepted. This is achieved through multiple phases that take the design from initial Architecture design to Final Design review:

1. Architecture Design
2. Control Design
3. Data Design
4. Functional Design
5. Physical Design
6. Test Design
7. Documentation Design
8. Intermediate Design Reviews (=> internal acceptances)
9. Detailed Design
10. Final Design Review

> Note that many of this phases happen in parallel! 

### Procedural Design Approach (an alternative to SDD)

Procedural Design methodologies, like structured design, involve top-down and bottom-up approaches centered on procedural programming languages. Most common apprach used is Parnas partitioning

#### Parnas Partitioning

1. Begin by characterizing the likely changes (consider different time horizons of the life cycle) and their effects.
2. Estimate the probabilities of each type of change.
3. Organize the software to conﬁne likely and signiﬁcant changes to a minimum amount of code.
4. Provide an “abstract interface” that abstracts from the potential differences.
5. Implement “objects,” that is, abstract data types and modules that hide changeable data and other structures.

> **Note:** Parnas highlighted that though the principles are easy to describe in theory books, practical examples are needed to give examples of how these principles can be implemented


**Motivation:** these steps
- reduce intermodule coupling
- increase intramodule cohesion
- information hiding
  - Parnas partitioning hides
    - the implementation details of software features, 
    - design decisions,
    - low-level hardware drivers,
    - etc
  - hiding limts the scope of impact of cuture changes or corrections
  - this technique is especially applicable and useful in embedded systems:
    - software directly tied to hardware
    - important to partition and localize implementation details with a partcular hardware interface
    - allows easier modifications
    - minimizes amount of code affected by changes


> **Definition:** If in designing the software modules, increasing levels of details are deferrend until later, then the software design approach is called *top-down*

> **Definition:** If the design detail is dealth with first and then increasing levels of abstraction are used to encapsulate those details, the approach is *bottop-up*

> **Note:** in many real-world applications both top-down and bottom-up approaches are used. 


### Structured Design

- Structured design (SD) is the **companion methodology** to structured analysis. 
- A systematic approach concerned with the **specification of the software architecture**
- involves a number stategies, techniques and tools
- supports a comprehenseive, easy-to-learn design process, intended to
  - provide high-quality software
  - minimize life cycle expences
  - improve 
    - reliability
    - maintainability
    - portability and 
    - overall performance of software products

- Structure analysis (SA)
  - related to SD as 
    - requirements representation (functional and flat) is related to 
    - software architecture (modular and hierachical)

- Transition from SA (Structured Analysis) to SD (Structured Design) is manual and requires significant problem-solving.  
- Involves analyzing and making trade-offs between alternative approaches.  
- SD typically follows these steps:  
  - Create a **Context Diagram (CD)** first.  
  - Develop a hierarchical set of **Data Flow Diagrams (DFDs)**.  
  - Use DFDs to partition system functions and document the partitioning.  
- **Level 0 DFD** represents the highest level of system abstraction.  
- Further DFDs are created through **downward leveling** (top-down design), breaking down processes into more detailed levels.  
- **Upward leveling** (bottom-up design) is also used by composing smaller processes into larger structures.  
- Most software designers prefer a **problem-driven mix** of both downward and upward leveling (Yourdon, 1989).


- **Context Diagram (CD)**:  
  - **Rectangles** represent **terminators** (agents, devices, or systems interacting with the system).  
  - Terminators are labeled with **noun phrases** describing data sources or destinations.  
  - **Circles** represent **processes** (data transformations) labeled with **verb phrases** describing operations.  
  - Solid **arrow lines** indicate data flow between terminators and processes, labeled with **noun phrases** describing the data.  
  - **Parallel lines** represent **data stores**, labeled with noun phrases naming databases, files, or repositories.  
  - Data stores are linked to processes for hierarchical flow.  

- **Data Flow Diagram (DFD) Guidelines**:  
  - Each DFD should contain **5 to 9 processes** (Yourdon, 1989).  
  - **Lowest-level processes** are described using **process specifications (P-SPECs)**.  
  - P-SPECs can be written in **decision tables, trees, pseudocode, or structured English**.  
  - Structured English balances **formal programming precision** with **readability** (Yourdon, 1989).  
  - Figure 6.7 illustrates the **evolution path** from a **context diagram** to **DFDs** and finally to **process specifications**.

## References

P. A. Laplante & S. J. Ovaska Real-Time Systems Design and Analysis: Tools for the Practitioner Softcopy of the book chapters can be found in MyCourses (You need to be in Aalto network or connected via Aalto VPN to download it for free) Chapter 5-9

Systems Engineering Body of Knowledge: https://sebokwiki.org/w/images/sebokwiki-farm!w/5/5c/Guide_to_the_Systems_Engineering_Body_of_Knowledge_v2.11.pdf 

IEEE 830:1998 IEEE Recommended Practice for Software Requirements Specifications: https://ieeexplore.ieee.org/document/720574

ISO/IEC/IEEE 29148-2011 International Standard - Systems and software engineering -- Life cycle processes -- Requirements engineering: https://ieeexplore.ieee.org/document/6146379


