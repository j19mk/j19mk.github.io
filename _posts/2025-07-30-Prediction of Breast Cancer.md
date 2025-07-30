---
layout: post
title: "<span style='color:black;'>Prediction of Breast Cancer</span>"
feature-img: "assets/img/feature-img/Regression.png"
tags: [R]
last_modified: "2025-07-30"
excerpt_separator: <!--more-->

---

Given that an average of 58 people are diagnosed with breast cancer every day in Australia, it is the most common cancer among women.<sup>[1]</sup>

<!--more-->
There are many tests used to diagnose breast cancer, such as imaging tests and biopsies.
In particular, X-ray imaging, one type of imaging test, is a basic diagnostic method that provides information about the tumor’s size, hardness, compactness, etc.

The dataset contains data on these factors for different cancer types (Malignant or Benign).
<a href="https://www.kaggle.com/datasets/yasserh/breast-cancer-dataset?resource=download" target="_blank">Dataset Source</a>


#### 1. Dataset Import and run library
```r
dataset <- read.csv("breast-cancer.csv")
library(tidyr)
library(dplyr)
library(reshape2)

head(dataset)
```

#### 2. Null check
```r
colSums(is.na(dataset))
```

#### 3. Summary statistics
```r
long_dataset <- dataset %>% 
  pivot_longer(
    cols = where(is.numeric),
    names_to = "Variable",
    values_to = "Value"
  )

sum_stat <- long_dataset %>% group_by(Variable) %>%
  summarise(
    qty = length(Value),
    mean = round(mean(Value), 2),
    sd = round(sd(Value), 2),
    ser = round(sd(Value) / sqrt(length(Value)), 2),
    min = round(min(Value), 2),
    Q1 = round(quantile(Value, probs = 0.25), 2),
    Median = round(median(Value), 2),
    Q3 = round(quantile(Value, probs = 0.75), 2),
    max = round(max(Value), 2),
  )
sum_stat
```
{% include aligner.html images="pexels/PredictionBC/sum.png" column=1 caption="Figure 1. Summary statistics" %}

#### 4. Visualization data
```r
long_dataset %>%
  filter(Variable %in% c("area_mean", "smoothness_mean", "compactness_mean", "concavity_mean", "concave.points_mean")) %>%
  ggplot(aes(x = diagnosis, y = Value)) +
  geom_boxplot() +
  facet_wrap(~Variable, scales = "free_y") + 
  theme_minimal()

long_dataset %>% 
  filter(Variable %in% c("area_se", "smoothness_se", "compactness_se", "concavity_se", "concave.points_se" )) %>%
  mutate(id = row_number()) %>%
  ggplot(aes(x = Value, y = id, color = diagnosis)) +
  geom_point() +
  facet_wrap(~ Variable, scales = "free_x") +
  theme_minimal()
```
{% include aligner.html images="pexels/PredictionBC/boxplot.png" column=1 caption="Figure 2. Boxplot" %}

{% include aligner.html images="pexels/PredictionBC/scattor.png" column=1 caption="Figure 3. Scattor " %}


```r
dataset <- dataset %>% mutate(diagnosis_num = ifelse(diagnosis == "M", 1, 0))

vars <- c("diagnosis_num", "area_mean", "smoothness_mean", "compactness_mean", "concavity_mean", "concave.points_mean")
cor_matrix <- round(cor(dataset[,vars]), 2)
long_cor <- melt(cor_matrix) # as cor_matrix is array or matrix, pivot_longer can be used.
long_cor

heatmap <- ggplot(long_cor, aes(x = Var1, y = Var2, fill = value)) +
             geom_tile(color = "white") + 
             geom_text(aes(label = value), color = "black", size =3)+
             scale_fill_gradient2(low = "blue", high = "red", mid = "white", name = "Correlation",
                                  midpoint = 0, limit = c(-1, 1) ) + 
             theme_minimal() +
             theme(axis.text.x = element_text(angle = 45, hjust = 1))
heatmap
```
{% include aligner.html images="pexels/PredictionBC/heatmap.png" column=1 caption="Figure 4. Heatmap" %}


#### Reference
[1] <a href="https://www.bcna.org.au/resources/about-breast-cancer/breast-statistics-cancer-in-australia/" target="_blank">Breast Cancer Network Australia</a>

