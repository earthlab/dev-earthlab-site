---
layout: single
title: 'Lidar Point Clouds'
authors: [Leah Wasser]
excerpt: "The overview page I used at CU 5 April 2016."
category: [course-materials]
class-lesson: ['veg-structure-lidar']
permalink: /course-materials/veg-structure-lidar-point-clouds
nav-title: 'point clouds'
sidebar:
  nav:
author_profile: false
comments: false
order: 2
---

## Overview

<div class='notice--success' markdown="1">

# Learning Outcomes

* Be able to describe what discrete lidar system measures.
* Be able to describe the format of data that a discrete return lidar system produces.

****

**Estimated Time:** 1-2 hours

[Download Lesson Data](#){: .btn .btn--large}
</div>


## LiDAR Point Clouds -- The Basics

Each point in a LiDAR dataset has a X, Y, Z value and other attributes. The points may be located anywhere in space are not aligned within any particular grid. <image: LiDAR data point spacing>.

LiDAR point clouds are typically available in a .las file format. The .las file format is a compressed format that can better handle the millions of points that are often associated with LiDAR data point clouds.

### Classifying LiDAR point clouds

LiDAR data points are vector data. LiDAR point clouds are useful because they tell us something about the heights of objects on the ground. However, how do we know whether a point reflected off of a tree, a bird, a building or the ground? In order to develop products like elevation models and canopy height models, we need to classify individual LiDAR points. We might classify LiDAR points into classes including:

- Ground
- Vegetation
- Buildings

Lidar Point cloud classification is often already done when you download LiDAR point clouds but just know that it’s not to be taken for granted! Programs such as lastools, fusion and terrascan are often used to perform this classification. Once the points are classified, they can be used to derive various LiDAR data products.


## What Is Discrete Return Lidar -- Plasio

### How discrete points are recorded:

<iframe width="560" height="315" src="//www.youtube.com/embed/uSESVm59uDQ?rel=0" frameborder="0" allowfullscreen></iframe>

### Plas.io

1. Concept: Lidar data measure elevation - plas.io, color by height map. NOTE: be sure to turn off intensity shading.
2. Concept: Lidar data can be CLASSIFIED to discriminate veg from ground from other objects.




## ### Three Common LiDAR Data Products ###
- [Digital Terrain Model](http://neonhighered.org/3dRasterLidar/DTM.html) - This product represents the ground.
- [Digital Surface Model](http://neonhighered.org/3dRasterLidar/DSM.html) - This represents the top of the surface (so imagine draping a sheet over the canopy of a forest).
- [Canopy Height Model](http://neonhighered.org/3dRasterLidar/CHM.html) - This represents the elevation of the Earth's surface - and it sometimes also called a DEM or digital elevation model.

<figure class="third">
    <a href="http://neonhighered.org/3d/SJER_DSM_3d.html"><img src="{{ site.baseurl }}/images/course-materials/lidar/dsm.png"></a>
    <a href="http://neonhighered.org/3d/SJER_DTM_3d.html"><img src="{{ site.baseurl }}/images/course-materials/lidar/dem.png"></a>
    <a href="http://neonhighered.org/3d/SJER_CHM_3d.html" target="_blank"><img src="{{ site.baseurl }}/images/course-materials/lidar/chm.png"></a>

    <figcaption> 3d models of a: LEFT: lidar derived digital surface model (DSM) , MIDDLE: Digital Elevation Model (DEM) and RIGHT: Canopy Height Model (CHM). Click on the images to view interactive 3d models. </figcaption>
</figure>


## CHM vs InSitu Differences Differences

<iframe width="700" height="800" frameborder="0" scrolling="no" src="https://plot.ly/~leahawasser/24.embed"></iframe>

<iframe width="700" height="700" frameborder="0" scrolling="no" src="https://plot.ly/~leahawasser/158.embed"></iframe>
