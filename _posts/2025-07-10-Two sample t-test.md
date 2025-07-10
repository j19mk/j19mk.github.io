---
layout: post
title: "<span style='color:black;'>Two sample t-test</span>"
feature-img: "assets/img/feature-img/t-test.jpeg"
tags: [Statistics]
last_modified: "2025-07-10"
excerpt_separator: <!--more-->
---

### Independent samples t-test
> A test to determine whether there is a significant difference between **the mean of two different groups**
<!--more-->

<br>
#### 1. Assumptions
* The data have been ramdomly sampled from population
* The data in each group is normally distributed
* The two groups are independent
* There is homogeneity of variance (equal variances between the two groups)

<br>
#### 2. Hypotheses

<u>Two tailed (non-directional)<u>
* Null hypothesis (H<sub>0</sub>): 

$$
H_0: \mu = \mu_0
$$
 
* Alternative hypotehsis (H<sub>1</sub>): 

$$
H_1: \mu \ne \mu_0
$$

<u>One tailed (Directional)<u>
* Null hypothesis (H<sub>0</sub>): The mean of group 1 is greater / less than or equal to the mean of group 2

$$ {\text{Left tailed test}} \quad H_0: \mu_1 \ge \mu_2 $$

$$ {\text{Right tailed test}} \quad H_0: \mu_1 \le \mu_2 $$

 
* Alternative hypotehsis (H<sub>1</sub>): The mean of group 1 is less / greater than the mean of group 2

$$ {\text{Left tailed test}} \quad H_1: \mu_1 < \mu_2 $$

$$ {\text{Right tailed test}} \quad H_1: \mu_1 > \mu_2 $$

<br>
#### 3. Test results
- t-value or t-statistics

$$ t = \frac{\text{Difference of group averages}}{\text{Standard error of difference}} = \frac{\bar{x_1} - \bar{x_2}}{s_{\bar{x}_1 - \bar{x}_2}}$$

- degree of freedom (df)

$$ df = n_1 + n_2 - 2 $$

- Effect size (Conhen's *d*)

$$ d = t \times \sqrt{\frac{n_1 + n_2}{n_1 \cdot n_2}} $$

- p-value

<br>
#### 4. How to interpret with the test results

- t-value
    - t-value > critical t-value = reject H<sub>0</sub>

- p-value
    - p-value $$< \alpha$$ (significant level) = reject H<sub>0</sub>
    - p-value $$\ge \alpha$$ (significant level) = fail to reject H<sub>0</sub>

- Effective size (Conhen's *d*)
    - ~ 0.2: small effect, but noticeable difference
    - ~ 0.5: medium effect, likely meaningful difference
    - ~ 0.8: large effect, very meaningful difference

<br>
#### 5. Examples
- **Q1. Is there a significant difference between the examination results in the summer and winter semester?**
    - <u>1) Dataset<u>
        - Summer semester
        
        | 52 | 61 | 40 | 46 | 50 | 56 |    |
        | 44 | 47 | 70 | 40 | 65 | 38 | 68 |
        
        
        - Winter semester
        
        | 53 | 71 | 38 | 34 | 68 | 68 |    |
        | 46 | 41 | 38 | 23 | 28 |    |    |
        
    - <u>2) Check assumptions<u>
        - Normality
        - Homogeneity of variance
        
    - <u>3) Hypotheses<u>
        - H<sub>0</sub>: There is no significant difference in examination results between the summer and winter semesters.
        
        - H<sub>1</sub>: There is significant difference in examination results between the summer and winter semesters.
    
    - <u>4) Results & Interpretation<u>
        
        - Normality
            - shaprio.test: As both p-values are greater than 0.05, H<sub>0</sub> which states that the data come from a normal distribution, is not rejected.
            
        - Homogeneity of variance
            - Boxplot: The data distribution for winter is slightly more spread out compared to that for summer, and both distributions are slightly right-skewed.
            - Levene Test: The p-value is 0.2494, which is greater than 0.05, indicating that the two groups have homogeneity of variance.
            
        - t-value: The t-value is 1.0352, which is smaller than the critical t-value (2.073873), indicating that H<sub>0</sub> is unlikely to be rejected.
        
        - p-value: The p-value (0.3118) is much greater than 0.05, leading to the conclusion that H<sub>0</sub> is not rejected.
        
    - <u>5) Conclusion<u>
    
        - To determine the difference examination results between the summer and winter semester, the independent samples t-test was conducted. There was no significant difference in examination results between the summer(mean = 52.08, sd = 11.03) and winter (mean = 46.18, sd = 16.71) semesters; t(22) = 1.0352, p-value = 0.3118(two-tailed). The difference in means (mean difference = 5.90, 95% CI = [-5.914, 17.705] was small, with a Cohen's d of 0.42
    
    - <u>6) R code & results<u>
        ```r        
        # 1. Dataset
        summer <- c(52, 61, 40, 46, 50, 56, 44, 47, 70, 40, 65, 38, 68)
        winter <- c(53, 71, 38, 34, 68, 68, 46, 41, 38, 23, 28)
      
        # 2-1. Normality check  
        shapiro.test(summer) # shariro.test
        shapiro.test(winter) # shariro.test
        ```
        {% include aligner.html images="pexels/twottest/twottest_shapiro_q1.png" column=1 caption="Figure 1. Shapiro.test" %}
    

        # 2-2. homogeneity of variance check
        boxplot(summer, winter,
                names = c("summer", "winter"),
                main = "Comparison of Two Groups",
                ylab = "Values",
                col = c("skyblue", "pink")) # boxplot

        
        {% include aligner.html images="pexels/twottest/twottest_boxplot_q1.png" column=1 caption="Figure 2. Boxplot" %}             

        # 2-2. homogeneity of variance check 
        library(car)

        group <- c(rep("summer", length(summer)), rep("winter", length(winter))) 
        values <- c(summer, winter)

        leveneTest(values ~ group) # levene test

        {% include aligner.html images="pexels/twottest/twottest_levene_q1.png" column=1 caption="Figure 3. Levene Test" %}
   
        # 3. Group statistics
        stat <- function(x) {
        n <- length(x) 
        m <- mean(x)
        s <- sd(x)
        
        cat("n:", n, "\n")
        cat("mean:", m, "\n")
        cat("sd:", s, "\n")
  
        return(invisible(list(n = n, mean = m, sd = s)))
        }

        stat(summer)  
        stat(winter)    

        {% include aligner.html images="pexels/twottest/twottest_stat_q1.png" column=1 caption="Figure 4. Statistics for two groups" %}

        # 4. Two sample t-test
        ttest <- t.test(summer, winter, var.equal = TRUE)
        ttest

        
        {% include aligner.html images="pexels/twottest/twottest_q1.png" column=1 caption="Figure 5. Two sample t-test" %}
                

        # 5. Critical t-value
        qt(p=.05/2, df=ttest$parameter, lower.tail=FALSE) # critical t-value

        
        {% include aligner.html images="pexels/twottest/twottest_criticalTvalue_q1.png" column=1 caption="Figure 6. Critical t-value" %}        
        # 6. Effect size
        install.packages("effsize")
        library(effsize)

        cohen.d(summer, winter)

        {% include aligner.html images="pexels/twottest/twottest_effectsize_q1.png" column=1 caption="Figure 7. Critical t-value" %}

        
<br>
- **Q2. Is there a significant difference between the body fats in men and women?**
    - <u>1) Dataset<u>
        - Body fats of Men
        
        | 13.3 | 6.0  | 20.0 | 8.0  | 14.0 |
        | 19.0 | 18.0 | 25.0 | 16.0 | 24.0 |   
        | 15.0 | 1.0  | 15.0 |      |      |
        
        - Body fats of Women
    
        | 22.0 | 16.0 | 21.7 | 21.0 | 30.0 |
        | 26.0 | 12.0 | 23.2 | 28.0 | 23.0 |
    
    
    - <u>2) Check assumptions<u>
    
        - Normality
        - Homogeneity of variance
    
    - <u>3) Hypotheses<u>
        - H<sub>0</sub>: There is no significant difference between the body fats in men and women.
        
        - H<sub>1</sub>: There is significant difference between the body fats in men and women.
        
    - <u>4) Results & Interpretation<u>
        
        - Normality
            - shaprio.test: As both p-values are greater than 0.05, H<sub>0</sub> which states that the data come from a normal distribution, is not rejected.
            
        - Homogeneity of variance
            - Boxplot: The data distribution for men is slightly more spread out compared to that for women, and both distributions are slightly right-skewed. Each group has one outlier. 
            - Levene Test: The p-value is 0.4855, which is greater than 0.05, indicating that the two groups have homogeneity of variance.
            
        - t-value: The t-value is -2.8, which is smaller than the critical t-value (2.0796), indicating that H<sub>0</sub> is likely to be rejected.
        
        - p-value: The p-value (0.01073) is much smaller than 0.05, leading to the conclusion that H<sub>0</sub> is rejected.
        
    - <u>5) Conclusion<u>
        - The two samples t-test was performed to determine that there is significantly diffference between the body fats in men and women. There was significantly difference the body fats between in men (m = 14.94615, sd = 6.8426) and women (m = 22.29, sd = 5.3197); t(21) = -2.8, p-value = 0.01073.  The difference in means (mean difference = 7.34, 95% CI = [-12.798, -1.889] was large, with a Cohen's d of -1.178.
    
            
    - <u>6) R code & results<u>
    
        ```r
        # 1. Dataset
        men <- c(13.3,    6.0,    20.0,    8.0, 14.0, 19.0,    18.0,    25.0,    16.0,    24.0, 15.0,    1.0,    15.0)
        women <- c(22.0,    16.0,    21.7,    21.0,    30.0, 26.0,    12.0,    23.2,    28.0,    23.0)
    
        # 2-1. Normality check  
        shapiro.test(men) # shariro.test
        shapiro.test(women) # shariro.test
        ```

        {% include aligner.html images="pexels/twottest/twottest_shapiro_q2.png" column=1 caption="Figure 8. Shapiro.test" %}

        # 2-2. homogeneity of variance check 
        boxplot(men, women,
            names = c("men", "women"),
            main = "Comparison of Two Groups",
            ylab = "Values",
            col = c("skyblue", "pink")) # boxplot

        {% include aligner.html images="pexels/twottest/twottest_boxplot_q2.png" column=1 caption="Figure 9. Boxplot" %}        
        
        # 2-2. homogeneity of variance cehck 
        library(car)

        group <- c(rep("men", length(men)), rep("women", length(women))) 
        values <- c(men, women)

        leveneTest(values ~ group) # levene test
        
        {% include aligner.html images="pexels/twottest/twottest_levene_q2.png" column=1 caption="Figure 10. Levene Test" %}
        
        # 3. Group statistics
        stat <- function(x) {
        n <- length(x) 
        m <- mean(x)
        s <- sd(x)
        
        cat("n:", n, "\n")
        cat("mean:", m, "\n")
        cat("sd:", s, "\n")
  
        return(invisible(list(n = n, mean = m, sd = s)))
        }

        stat(men)  
        stat(women)
        
        {% include aligner.html images="pexels/twottest/twottest_stat_q2.png" column=1 caption="Figure 11. Statistics for two groups" %}
            
        # 4. Two sample t-test
        ttest <- t.test(men, women, var.equal = TRUE)
        ttest # Two sample t-test

        {% include aligner.html images="pexels/twottest/twottest_q2.png" column=1 caption="Figure 12. Two sample t-test" %}

        
        # 4. Critical t-value
        qt(p=.05/2, df=ttest$parameter, lower.tail=FALSE) # critical t-value

        {% include aligner.html images="pexels/twottest/twottest_criticalTvalue_q2.png" column=1 caption="Figure 13. Critical t-value" %}
        
        # 6. Effect size
        install.packages("effsize")
        library(effsize)

        cohen.d(summer, winter)  

        {% include aligner.html images="pexels/twottest/twottest_effectsize_q2.png" column=1 caption="Figure 14. Critical t-value" %}


### References
* Staistical units from <a href="https://www.mq.edu.au/" target="_blank">Macquarie University</a>
* <a href="https://chatgpt.com/" target="_blank">Chatgpt</a>
* <a href="https://datatab.net/tutorial/unpaired-t-test" target="_blank">DATAtab</a>
* <a href="https://www.jmp.com/en/statistics-knowledge-portal/t-test/two-sample-t-test" target="_blank">jmp.STATISTICAL DISCOVERY</a>
* <a href="https://www.geeksforgeeks.org/r-language/two-sample-t-test-in-r/" target="_blank">GeeksforGeeks</a>
