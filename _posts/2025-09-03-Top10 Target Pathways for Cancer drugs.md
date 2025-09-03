---
layout: post
title: "<span style='color:black;'>Top 10 Target Pathways for Cancer drugs</span>"
feature-img: "assets/img/feature-img/cancer.jpg"
tags: [R]
last_modified: "2025-09-03"
excerpt_separator: <!--more-->

---

Cancer is one of the leading causes of death worldwide, accounting for nearly 10 million deaths in 2020. The most common cancers are breast, lung, colorectal, and prostate cancers. <sup>[1]</sup>

<!--more-->
A variety of cancer drugs have been developed to target diverse signaling pathways. This dataset includes information on different drugs, their molecular targets, and associated target pathways. 

Using this dataset, the top 10 target pathways for cancer drugs were first identified, and the drug names and screening sites for the top 3 target pathways were summarized.

<a href="https://www.kaggle.com/datasets/samiraalipour/genomics-of-drug-sensitivity-in-cancer-gdsc" target="_blank">Dataset Source</a>


#### 1. Dataset Import and run library
```r
compound <- read_csv("Compounds-annotation.csv")
library(readr)
library(ggplot2)
library(dplyr)
library(tidyr)

compound
```
{% include aligner.html images="pexels/compound/compounds.png" column=1 caption="Figure 1. Compounds-annotation dataset" %}

#### 2. Reshaping the data
```r 
compound_long <- compound %>%
  pivot_longer(
    cols = c(SYNONYMS, TARGET, TARGET_PATHWAY),
    names_to = "Variables",
    values_to = "Values") %>%
  separate_rows(Values, sep = ",") %>%
  mutate(Values = trimws(Values)) 
  
compound_long
```
{% include aligner.html images="pexels/compound/longform.png" column=1 caption="Figure 2. Long form of the datatset" %}


#### 2. Missing data check
```r
compound_na_rows <- compound_long %>%  
  filter(is.na(Values))
compound_na_rows

compound_no_na <- compound_long %>%
  filter(!is.na(Values))
compound_no_na
```
{% include aligner.html images="pexels/compound/na.png" column=1 caption="Figure 3. Missing data" %}

{% include aligner.html images="pexels/compound/wo_na.png" column=1 caption="Figure 4. Dataset without missing data" %}


#### 3. Top 10 Target Pathway
```r
top10_pathway <- compound_no_na %>%
  filter(Variables == "TARGET_PATHWAY") %>%
  group_by(Values) %>%
  summarize(count=n(), .groups="drop") %>%
  arrange(desc(count)) %>%
  slice_head(n=10)


# top10_pathway <- compound_no_na %>%
#   filter(Variables == "TARGET_PATHWAY") %>%
#   group_by(Values) %>%
#   summarize(count=n(), .groups="drop") %>%
#   slice_max(order_by = count, n = 10) # Different code but the same result

top10_pathway

```
{% include aligner.html images="pexels/compound/top10.png" column=1 caption="Figure 5. Top 10 Target Pathway" %}

#### 4. Visualization data
```r
ggplot(top10_pathway, aes(x = Values, y = count, fill = Values)) + 
  geom_col() + 
  geom_text(aes(label = count), hjust = 1.5, color = "white") + 
  coord_flip() + 
  theme_minimal() + 
  labs(x = "Pathway", y = "Count",title = "Top 10 Target pathway")
```

{% include aligner.html images="pexels/compound/top10plot.png" column=1 caption="Figure 6. Top10 Target Pathway" %}

#### 5. Top 3 Target Pathways: Screening Sites and Drug Names
```r
Other <- compound_long %>% filter(Values == "Other") %>%
  pivot_wider(
    names_from = Variables, 
    values_from = Values, 
    values_fn = list(Values = ~paste(., collapse = ",")) 
  )

kinases <- compound_long %>% filter(Values == "kinases") %>%
  pivot_wider(
    names_from = Variables, 
    values_from = Values, 
    values_fn = list(Values = ~paste(., collapse = ",")) 
  )

PI3K <- compound_long %>% filter(Values == "PI3K/MTOR signaling") %>%
  pivot_wider(
    names_from = Variables, 
    values_from = Values, 
    values_fn = list(Values = ~paste(., collapse = ",")) 
  )
  
Other
kinases
PI3K
```

{% include aligner.html images="pexels/compound/other.png" column=1 caption="Figure 7. Screening site and drug name of Other target pathway " %}

{% include aligner.html images="pexels/compound/kinases.png" column=1 caption="Figure 8. Screening site and drug name of Kinases target pathway " %}

{% include aligner.html images="pexels/compound/PI3K.png" column=1 caption="Figure 9. Screening site and drug name of PI3K/MTOR signaling target pathway " %}


#### Reference
[1] <a href="https://www.who.int/news-room/fact-sheets/detail/cancer" target="_blank">World Health Organization</a>
