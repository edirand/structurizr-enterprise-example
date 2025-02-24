package org.example;

import com.structurizr.Workspace;
import com.structurizr.dsl.StructurizrDslParser;

import java.io.File;

public class Main {
    public static void main(String[] args) throws Exception {
        if (args.length != 1) {
            System.out.println("Usage: program <workspace-file>");
        }

        LandscapeGenerator generator = new LandscapeGenerator();
        StructurizrDslParser parser = new StructurizrDslParser();
        parser.parse(new File(args[0]));

        Workspace systemLandscapeWorkspace = parser.getWorkspace();
        systemLandscapeWorkspace.setName("Landscape");

        generator.generateSystemLandscape(systemLandscapeWorkspace);
    }
}