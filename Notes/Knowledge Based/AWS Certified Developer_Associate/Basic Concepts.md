# Basic Concepts
## AWS Regions
+ AWS has **Regions** all around the world;
+ Names can be `us-east-1`, `eu-west-3`...;
+ A Region is a cluster of data centers;
+ Most AWS services are **region-scoped**;

### How to Choose an AWS Region?

+ **Compliance** with data governance and legal requirements:
	+ Data never leaves a region without your explicit permission.
+ **Proximity** to costumers:
	+ Reduced latency.
+ **Available services** within a Region:
	+ New services and new features aren't available in every Region.
+ **Pricing**:
	+ Pricing varies region to region and is transparent in the service pricing page.


## AWS Availability Zones

+ Each region has many availability zones:
	+ Usually 3;
	+ Minimum is 2;
	+ Maximum is 6;
	+ Ex.:
		+ Sidney:
			+ `ap-southeast-2a`;
			+ `ap-southeast-2b`;
			+ `ap-southeast-2c`.
+ Each availability zone (AZ) is one or more discrete data centers with redundant power, networking, and connectivity.
+ The AZs are separate from each other, so that they're isolated from disasters;
+ They're connected with high bandwidth, ultra-low latency networking.

## AWS Points of Presence (Edge Locations)

+ AWS has more than 216 Points of Presente (205 Edge Locations and/or Regional Caches) in 84 cities across 42 countries;
+ Content is delivered to end users with lower latency;
