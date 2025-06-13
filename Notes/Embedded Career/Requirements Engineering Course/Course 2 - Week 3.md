# Course 2 - Week 3
## Reuse of Domain Knowledge

### Requirements Taxonomies: Domain-Independent Knowledge

* Non-Functional Requirements:
	* Quality of Service:
		* Safety;
		* Security:
			* Confidentiality;
			* Integrity;
			* Availability
		* Reliability;
		* Performance:
			* Time
			* Space
			* Cost
		* Interface:
			* User Interaction:
				* Usability;
				* Convenience.
			* Device Interaction
			* Software Interoperability
		* Accuracy;
	* Compliance;
	* Architectural Constraint
		* Installation;
		* Distribution.
	* Development Constraint:
		* Cost;
		* Deadline;
		* Variability;
		* Maintanability.
## Inferring declarative requirements specifications from operational scenarios

http://citeseer.ist.psu.edu/viewdoc/summary?doi=10.1.1.123.6403

We learn, find patterns, and revise.  In this paper you'll read about moving scenarios into stronger forms.  

"Scenarios are increasingly recognized as an effective means for eliciting, validating, and documenting software requirements. This paper concentrates on the use of scenarios for requirements elicitation and explores the process of inferring formal specifications of goals and requirements from scenario descriptions. Scenarios are considered here as typical examples of system usage; they are provided in terms of sequences of interaction steps between the intended software and its environment. Such scenarios are in general partial, procedural, and leave required properties about the intended system implicit. In the end such properties need to be stated in explicit, declarative terms for consistency/completeness analysis to be carried out. A formal method is proposed for supporting the process of inferring specifications of system goals and requirements inductively from interaction scenarios provided by stakeholders. The method is based on a learning algorithm that takes scenarios as examples/counterexamples and generates a set of goal specifications in temporal logic that covers all positive scenarios while excluding all negative ones. The output language in which goals and requirements are specified is the KAOS goal-based specification language. The paper also discusses how the scenario-based inference of goal specifications is integrated in the KAOS methodology for goal-based requirements engineering. In particular, the benefits of inferring declarative specifications of goals from operational scenarios are demonstrated by examples of formal analysis at the goal level, including conflict analysis, obstacle analysis, the inference of higherlevel goals, and the derivation of alternative scenarios that better achieve the underlying goals. Index Terms—Scenario-based requirements elicitation, inductive inference of specifications, goal-oriented requirements engineering, specification refinement and analysis, lightweight formal methods. "