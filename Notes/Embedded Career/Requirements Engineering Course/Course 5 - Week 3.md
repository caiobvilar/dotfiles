# Course 5 - Week 3
## Lower-Level Diagramming

At a lower level, Entity Relationship Diagrams, Data Flow Diagrams, and SADT diagrams can be used. All three sets of diagrams work together to explain lower-level relationships and dataflow for components in the system-to-be. In this lesson, we'll discuss what these diagrams look like and what information should be included in such diagrams.

## Learning Objectives

 *  Distinguish the components of an entity relationship diagram
 *  Identify the advantages and disadvantages of entity relationship diagrams
 *  Identify the SADT diagrams and their purpose
 *  Recognize the differences between entity relationship diagrams and data flow diagrams. Discuss how they work together.
 *  Create a dataflow diagram for a small system

## Lesson 1 - Entity Relationships and Class Diagrams

### Conceptual Structures: Entity-Relationship Diagrams

* Declare conceptual items, structure them
* Entity: class of concept instances
	* Having distinct identities
	* Sharing common features (e.g. attributes or relationships)
		* These components are represented by a rectangle
* Attribute: feature intrinsic to an entity or a relationship
	* Has a range of values
* **N**-ary relationship: feature conceptually linking **N** entities, each playing a distinctive role (**N** >=2)
* **Multiplicity**, on one side: min & max number of entity intances, on this side, linkable at the same time to single tuple of entity instances on the other sides

### Entity-Relationship Diagram

* Diagram annotations: to define elements precisely
	* Essential for avoiding specification errors & flaws
	* E.g.: annotation for Participant entity on a ER Diagram for a meeting scheduler:
		* "Person expected to attend the meeting, at elast partially, under some specific role. Appears in the system when the meeting is initiated and disappears when the meeting is no longer relevant to the system".
* Entity specialization: subclass of concept instances, further characterized by specific features (attributes, relationships)
* e.g.: *ImportantParticipant*, with specific attribute *Preferences* **Inherits** relationships *Invitation, Constraints*, attribute *Address*
* Obs.: an instante of the subclass must be an instance of the super class. This allows for rich structuring mechanism for factoring out structural commonalitites into super classes. This is very similar to inheritance in OOP. They can also override general attributes and specializations. ER Diagrams are very common because they are simple. They're simple graphic notation for structuring and relating domain concepts.
* Diagrams allow you to put in these multiplicities allowing simple statement patterns to be formalized. 
* Specialization and inheritance help us to factor out commonalities to identify features that need to be reused and enhance modify ability.
* Thus, we're also helping the developers to relay entities very clearly to objects. However, there is no distinction between the requirements and the domain descriptions
* You can also simplify Diagrams to class diagrams.
* And they're simple to represent in any UML drawing tool because UML in itself is an object-oriented modelling language. Class diagrams don't give you much, but they can be useful.

## Paper: The entity-relationship model for multilevel security

[Link to Paper](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.22.9729)

Pernul, Günther, Werner Winiwarter, and A. Min Tjoa. "The entity-relationship model for multilevel security." International Conference on Conceptual Modeling. Springer, Berlin, Heidelberg, 1993.

Including security in models is rarely done and is challenging.  This paper emphasizes the challenges and also shows how ER models can be extended to include security constraints.  This is a similar concept to the misuse/abuse cases discussed earlier, but at a lower level.  

Paper Abstract: "A design environment for security critical database applications that should be implemented by using multilevel technology is proposed. For this purpose, the Entity-Relationship model is extended to capture security semantics. Important security semantics are defined and a language to express them in an ER model by means of security constraints is developed. The main contribution consists of the development and implementation of a rule-based system with which security semantics specified may be checked for conflicting constraints. The check involves application independent as well as application dependent integrity constraints and leads to a non conflicting conceptual representation of the security semantics of a multilevel secure database application."

## Lesson 2 - SADT Diagrams: Actigrams and Datagrams
* Another type of diagram that's often used is the SADT diagram, really is a set of diagrams.
* The SADT diagram set shows two things:
	* They show conceptual structures and how they relate
	* The activities that take place to process the data.
* SADT stands for **Structured Analysis and Design Technique**, and gives a way to represent the activities and data that are working in your system in a graphical way.
* Capture activities & data in the system (as-is or to-be)
* Actigram: relates activities through data dependency links
	* West ->: Input data;
	* East ->: output data;
	* North ->: controlling data/event;
	* South ->: processor
	* Activities refinable into sub-activities
