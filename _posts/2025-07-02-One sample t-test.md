---
layout: post
title: "<span style='color:black;'>One sample t-test</span>"
feature-img: "assets/img/feature-img/t-test.jpeg"
tags: [Statistics]
last_modified: "2025-07-02"
excerpt_separator: <!--more-->
---

### One sample t-test
> A test to determine whether there is a significant difference between **the mean of a population** and **the mean of a single sample**
<!--more-->

#### 1. Assumptions
- The data have been ramdomly sampled from population
- The data is normally distributed

    
#### 2. Hypotheses

<u>Two tailed (non-directional)<u>
- Null hypothesis (H<sub>0</sub>): The mean value of the population is equal to the sample mean
 
$$ H_0: \mu = \mu_0 $$
 
- Alternative hypothesis (H<sub>1</sub>): The mean value of the population is not equal to the sample mean

$$ H_1: \mu \ne \mu_0 $$

<u>One tailed (directional)<u>
- Null hypothesis (H<sub>0</sub>): The mean value of the population is equal to or greater than (or less than) that of the specified value.

$$ {\text{Left tailed test}} \quad H_0: \mu \ge \mu_0 $$

$$ {\text{Right tailed test}} \quad H_0: \mu \le \mu_0 $$

- Alternative hypothesis (H<sub>1</sub>): The mean value of the population is smaller (or larger) than the specified values.

$$ {\text{Left tailed test}} \quad H_1: \mu > \mu_0 $$

$$ {\text{Right tailed test}} \quad H_1: \mu < \mu_0 $$

{% include aligner.html images="pexels/onetail.png" column=1 caption="Figure 1. Comparison between two tailed test and one tailed test" %}


#### 3. Test results
- t-value or t-statistics
    - It measures how far the sample mean is from the hypothesized population mean in units of the standard error

$$ t = \frac{\text{Difference between mean values}}{\text{Standard deviation from the mean}} = \frac{\bar{x} - \mu_0}{s / \sqrt{n}}$$
    
            


- p-value

- degree of freedom (df)




### References
* Staistical units from <a href="https://www.mq.edu.au/" target="_blank">Macquarie University</a>
* <a href="https://chatgpt.com/" target="_blank">Chatgpt</a>
* <a href="https://datatab.net/tutorial/t-test" target="_blank">DATAtab</a>
* <a href="https://www.jmp.com/en/statistics-knowledge-portal/t-test" target="_blank">jmp.STATISTICAL DISCOVERY</a>
* <a href="https://arshren.medium.com/hypothesis-testing-an-intuitive-explanation-898d547db38d" target="_blank">Figure 1</a>
