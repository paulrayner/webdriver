package cuke4duke.webdriver;

import cuke4duke.annotation.EN.*;
import cuke4duke.annotation.Pending;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Paul
 * Date: Apr 2, 2010
 * Time: 9:54:31 AM
 * To change this template use File | Settings | File Templates.
 */
public class WhatToPackSteps {
    @Given("^a master packing list with:$")
    public void aMasterPackingListWithWithTable(cuke4duke.Table table) throws Exception {
        // create a text file with the items from the table
        List<Map<String,String>> hashes = table.hashes();
        Iterator<Map<String,String>> iter = hashes.iterator();

        BufferedWriter out = new BufferedWriter(new FileWriter("items.txt"));
        while (iter.hasNext())  {
            Map<String,String> item = iter.next();
            out.write(item.get("item") + "\n");
        }

        out.close();
    }

    @When("^I filter my packing list for cold weather$")
    @Pending
    public void iFilterMyPackingListForColdWeather() {
        // run pack_my_suitcase packing_list.txt cold
        // save results to a class variable
    }

    @Then("^the list should contain only:$")
    @Pending
    public void theListShouldContainOnlyWithTable(cuke4duke.Table table) {
        // check that results only contain what's in the table
    }
}
