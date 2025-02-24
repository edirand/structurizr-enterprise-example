# Structurizr Enterprise

An example of how to use Structurizr in an enterprise context, based on https://docs.structurizr.com/usage/enterprise.

## Disclaimer

This repository is a POC, made in a rush to quickly test the concept. For a real official example, follow the 
[Structurizr Patreon](https://www.patreon.com/posts/enterprise-usage-122200417).

## Overview

As stated in the enterprise usage of Structurizr, at some point, you may need to:
- ensure consistency across all teams modelling their own software systems
- have a centralised landscape view across all teams 

Here, we will propose the following approach to respond to this problem:
- use a single shared **System Catalog** that defines all the people and software systems across all teams
- ask each team to extend this **System Catalog** in their own workspaces (using the !element keyword) 
- ask each team to publish their workspace to a single on-premises installation
- generate a landscape workspace by aggregating all published workspaces

## Getting started

### Setup Structurizr onpremises

The first step is to setup Structurizr onpremises using docker-compose.
You will need to generate an admin API Key and hash it using Bcrypt. In the *docker-compose.yml* file, replace <CHANGE_ME> with your Bcrypt key.

Run `docker compose up -d` to get your instance running.

Visit http://localhost:8080, connect to Structurizr using default account (default: structurizr/password) and create 5 empty workspaces.

### System Catalog

Our first workspace will be our shared system catalog. A sample is available in *system-catalog* folder.
This workspace defines only your global systems and persons. Don't add any relationship here or any view.

Upload the dsl to Structurizr in the workspace 1.
Now, to be extendable by the teams, you will need to share it. To do it, visit once again http://localhost:8080 and login, 
open the system catalog workspace, click on **Sharing link** and then click on **DSL - View**. You should see
your DSL. Note the url (something like http://localhost:8080/share/1/4d9e4fa2-3b78-4383-8c8e-7ed433b2db6f/dsl). This url
will be used by the teams to extend our system.

### Model each system

3 workspaces are available in this repository, each representing a system owned by a team. Imagine each team is modelling 
his own system in different repositories.

To use our **System Catalog**, each team needs to:
- add `extends <your DSL sharing url>` after the `workspace` keyword to allow extending the catalog
- add `!element <system name defined in the system catalog DSL>` to describe the system defined in the catalog
- add the `configuration` block, with a common scope "softwaresystem"

The scope key will be used by our Java tool to filter the workspaces and generate the landscape view.

Before uploading the DSLs to Structurizr, remember to change the **System Catalog** share link in each workspace.dsl file.
Upload your DSLs to Structurizr in workspaces 2, 3 and 4. You should see now that each workspace have imported the models 
defined in the **System Catalog**.

### Generate system landscape

Now that every workspace is ready, we need to generate a landscape view for our organization. To do this,
we need to use a little Java program available in this repository. This tool is a slightly modified version of the one
available in the [structurizr/examples](https://github.com/structurizr/examples) repository.

To run it, you need to set the following environment variables:
- STRUCTURIZR_URL: your Structurizr instance url (http://localhost:8080)
- ADMIN_API_KEY: your raw API Key (the one you generated before hashing with Bcrypt, not the "Bcrypted" one)
- OUTPUT_WORKSPACE_ID: the ID of the workspace that will host your system landscape (in our example, 5)

Run the tool giving the path to your **System Catalog** DSL file (in our case, "system-catalog/system-catalog.dsl") as argument.
The tool will connect to Structurizr, get all the workspaces with the scope "softwaresystem", and merge 
the relationships with your **System Catalog**. The result will then be uploaded to the workspace 5.

Run the tool, visit http://localhost:8080, and you should see a new "Landscape" workspace.

## Sources

This work (especially the java tool) is based on:
- https://docs.structurizr.com/usage/enterprise
- https://github.com/structurizr/examples
- https://www.youtube.com/watch?v=xrxQZdfme_o&t=1590s&ab_channel=DevoxxUK
