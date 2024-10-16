---
sidebar_position: 1
---

# Basic Concepts

## JiaoZi File System
The JiaoZi File System (JZFS) is the backbone of the GitData.AI's data platform, providing a secure, scalable, and efficient way to store and manage large amounts of data. It is a version-controlled data management system that enables users to store any type of data in any format and scale, from a single file to a directory of files. The PFS is built on top of Postgres and S3, ensuring that your data is secure, consistent, and easily accessible. With PFS, users can version their data and work collaboratively with their teams, using branches and commits to manage and track changes over time.

### Repositories (Repo)
JZFS repositories are version controlled, meaning that they keep track of changes to the data stored within them. Each repository can contain any type of data, including individual files or directories of files, and can handle data of any scale.

### Branches
Branches in JZFS are similar to branches in Git. They are pointers to commits that move along a growing chain of commits. This allows you to work with different versions of your data within the same repository.

### Commits
A commit in JZFS is created automatically whenever data is added to or deleted from a repository. Each commit preserves the state of all files in the repository at the time of the commit, similar to a snapshot. Each commit is uniquely identifiable by a UUID and is immutable, meaning that the source data can never change.

## JiaoZi Flow
The JiaoZi Flow (JZFlow) is a critical piece of a MLOps system that manages, executes, and monitors workflow/pipeline automation. 

> Workflow is an abstract and broad concept; it is essentially a sequence of operations that are part of some larger task. If you can devise a plan with a set of tasks to complete a work, this plan is a workflow. For example, we can define a sequential workflow for training a machine learning (ML) model. This workflow can be composed of the following tasks: fetching raw data, rebuilding the training dataset, training the model, evaluating the model, and deploying the model. 
> 
> In general, a workflow is a sequence of operations that are part of some larger task. A workflow can be viewed as a directed acyclic graph (DAG) of steps.

With JZFlow, you can define, execute, and monitor complex data transformations using code that is run in Docker containers. The output of each pipeline is version-controlled in a JZFS data repository, providing a complete, auditable history of all processing steps. In this way, PPS provides a flexible, data-driven solution for managing your data processing needs, while keeping data and processing results secure, reproducible, and scalable.



### Pipelines
JZFlow pipelines are used to transform data from JZFS repositories. The output data is versioned in a JZFS data repository, and the code for the transformation is run in Docker containers. Pipelines are triggered by new commits to a branch, making them data-driven.

### Jobs
A job in JZFlow is the execution of a pipeline with a new commit. The data is distributed and parallelized computation is performed across a cluster. Each job is uniquely identified, making it possible to reproduce the results of a specific job.

### Compute Unit
A Compute Unit in JZFlow is a unit of computation for a job. It is used to distribute the processing workloads and to define how data can be split for parallel processing.

### Projects
A project in JZFlow is a collection of pipelines and their associated data repositories. It is used to organize pipelines and repositories into logical groups. Projects are also used to manage access control for pipelines and repositories.
