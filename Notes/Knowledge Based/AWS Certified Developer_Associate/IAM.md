# IAM

+ IAM = Identity an Access Management, **Global Service**;
+ **Root account** created by default, shouldn't be used or shared;

## Users & Groups

+ **Users** are people within your organization, and can be grouped;
+ *Groups can only contain users, not other Groups*;
+ Users don't have o belong to a group, and user can belong to multiple groups;

## Permissions

+ **Users or Groups** can be assigned JSON documents called policies;
+ Policies define the **permissions** of the users;
+ In **AWS** you apply the **Least Privilege Principle**:
	+ Don't give more permissions than a user needs;

### Tags

+ IAM tags are key-value pairs you can add to your user;
+ Tags can include user information, such as an email address, or can be descriptive, such as a job title;
+ You can use the tags to organize, track, or control access for this user.

## IAM Policies Inheritance

+ Users assing to Groups inherit each policies from each group it is attached to/

## IAM Policies Structure

+ Consists of:
	+ Version: policy language version, always include "2012-10-17";
	+ Id: an identifier for the policy (optional);
	+ Statement: one or more individual statements (required);
+ Statements consists of:
	+ Sid: and identifier for the statement (optional);
	+ Effect: whether the statement allows or denies access (Allow, Deny);
	+ Principal: account/user/role to which this policy is applied to;
	+ Action: list of actions this policy allows or denies;
	+ Resource: a list of resources the action is applied to;
	+ Condition: conditions for when this policy is in effect (optional).

```json
{
	"Version": "2012-10-17",
	"Id": "S3-Acount-Permissions",
	"Statement": [
		{
			"Sid": "1",
			"Effect": "Allow",
			"Principal": {
				"AWS": ["arn:aws:iam:123456789012:root"]
			},
			"Action": [
				"s3:GetObject",
				"s3:PutObject"
			],
			"Resource": ["arn:aws:s3:::mybucket/*"]
		}
	]
}
```