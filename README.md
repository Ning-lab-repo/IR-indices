# Machine learning-based comparison and optimization of TyG, TyG-BMI and TG/HDL-C indices
This repository contains the code and scripts associated with the article titled "Machine learning-based comparison and optimization of TyG, TyG-BMI, and TG/HDL-C indices for short- and long-term mortality prediction in critically ill stroke patients".

## Background
Stroke is a leading cause of mortality and disability worldwide, particularly among patients admitted to the intensive care unit (ICU), where prognosis remains poor. Insulin resistance (IR) has been recognized as a significant risk factor for stroke, with alternative IR markers-the triglyceride-glucose (TyG) index, TyG-body mass index (TyG-BMI), and triglyceride/high-density lipoprotein cholesterol ratio (TG/HDL-C)-demonstrating strong predictive capabilities. While prior studies have highlighted the association between these IR indices and all-cause mortality (ACM) in critically ill stroke patients, the optimal index for prognostic prediction remains unclear.  

## Methods
This study utilized the MIMIC-IV database to identify patients diagnosed with stroke in ICUs. Cox proportional hazards models, Kaplan-Meier (KM) survival analysis, and restricted cubic splines were employed to explore the associations between these three indices and mortality. Feature selection was performed with the Boruta algorithm and SHapley Additive exPlanations (SHAP) values, while random survival forest (RSF) models assessed the predictive efficacy of IR indices combined with the basic features. KM analysis stratified patients into quartiles based on model-derived risk scores for evaluating risk stratification.  

## Results
A total of 1,054 critically ill stroke patients were included. Elevated TyG index levels were independently associated with increased 30-day mortality (hazard ratio [HR], 1.52; 95% confidence interval [CI], 1.03-2.24), while TyG-BMI correlated with reduced 1-year mortality risk (HR 0.47, 95% CI 0.34-0.64). The predictive value of the TG/HDL-C index was comparatively weaker. The machine learning models enhanced by incorporating IR indices, demonstrated improved predictive performance, with the base + TyG-BMI model exhibiting the most robust performance, achieving AUCs of approximately 0.8. KM analysis confirmed significant survival differences across the quartiles based on models’ risk scores.

## Conclusions
This study is the first to compare the predictive value of IR indices for short- and long-term mortality in critically ill stroke patients, elucidating that the TyG functions as a significant independent predictor of short-term mortality, whereas the TyG-BMI as a robust predictor of the long term. The machine learning models developed in this investigation demonstrate suitability for clinical application, which underscores the substantial implications of these findings for personalized risk assessment and the prognostic management of stroke patients.  

## Keywords
Triglyceride-glucose index, Triglyceride-glucose-body mass index, Triglyceride/high-density lipoprotein cholesterol ratio, Stroke, All-cause mortality, Machine learning, Risk prediction

## Version
R software (version 4.4.0, R Foundation for Statistical Computing, Austria);  
Python (version 3.10)

## Scripts introduction  
Feature selection is crucial for determining which variables are most significant in predicting events, for which Boruta and SHapley Additive exPlanation (SHAP) were introduced for assessment.   

* Boruta.r: The Boruta algorithm, a prominent feature selection technique based on the random forest classifier, generates shadow features by duplicating the original dataset. If the Z-score of a true feature consistently exceeds the maximum Z-score of the shadow features across multiple independent tests, that feature is deemed "important".

* SHAP.ipynb: SHAP utilizes Shapley values from cooperative game theory to decompose model predictions into the contributions of individual features. It could analyze the impact of each feature on the prediction efficacy by calculating their marginal contributions under various conditions. Features are ranked according to the absolute values of their SHAP scores, with higher absolute values indicating a greater influence on the prediction.

* RSF.ipynb: The dataset was partitioned into training and validation sets with a 7:3 ratio, with the former used for model development. Multiple feature sets, combining the base one along with diverse IR indices, were fed into a Random Survival Forest (RSF), which predicted the mortality risk in critically ill stroke patients. Multiple performance metrics were used to evaluate the models in the validation cohort, including the accompanying area under the curve (AUC), Accuracy, Sensitivity, Specificity, Positive Predictive Value (PPV), Negative Predictive Value (NPV), F1 Score, and Matthew's Correlation Coefficient (MCC), ensuring reliability and consistency. 
  
