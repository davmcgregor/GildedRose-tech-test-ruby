### [Makers Academy](http://www.makersacademy.com) - Week 10 tech test
[![Build Status](https://travis-ci.com/davmcgregor/GildedRose-tech-test-ruby.svg?branch=master)](https://travis-ci.com/davmcgregor/GildedRose-tech-test-ruby)

# Gilded rose tech test Search Results 🌹 

#### Technologies: Ruby, RSpec, TravisCI

[Task](#Task) | [Specification](#Specification) | [Testing](#Testing) | [Further Instructions](#Further_Instructions) 

![gildedrose](https://miro.medium.com/max/1200/1*NoIcn06ksMOa-Ydv1UvYEw.jpeg)

This is a well known kata developed by [Terry Hughes](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/). This is commonly used as a tech test to assess a candidate's ability to read, refactor and extend legacy code. 

## <a name="Task">The Task</a>

"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

## <a name="Specification">Specification</a>

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

* “Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."*

## <a name="Testing">Testing</a>


## <a name="Further_Instructions">Further Instructions</a>

Choose [legacy code](https://github.com/emilybache/GildedRose-Refactoring-Kata) (translated by Emily Bache) in the language of your choice. The aim is to practice good design in the language of your choice. Refactor the code in such a way that adding the new "conjured" functionality is easy.

HINT: Test first FTW!

![Tracking pixel](https://githubanalytics.herokuapp.com/course/individual_challenges/gilded_rose.md)