<h1 align="center">Imitate Before Detect: Aligning Machine Stylistic Preference for Machine-Revised Text Detection</h1>

<p align="center">
   <a href="https://scholar.google.com/citations?user=Au_y5poAAAAJ">Jiaqi Chen</a><sup>1,4*</sup>, <a href="https://xyzhu1225.github.io/">Xiaoye Zhu</a><sup>2,3*</sup>, <a href="https://leolty.github.io/">Tianyang Liu</a><sup>6</sup>, Ying Chen<sup>7</sup>, Xinhui Chen<sup>5</sup>,<br> <a href="https://scholar.google.com/citations?user=koA9QbMAAAAJ">Yiwen Yuan</a><sup>8</sup>, <a href="https://cooperleong00.github.io/">Chak Tou Leong</a><sup>9</sup>, <a href="https://zcli-charlie.github.io/">Zuchao Li</a><sup>5</sup>, Tang Long<sup>11</sup>, <a href="https://yusalei.github.io/">Lei Zhang</a><sup>6</sup>, <a href="https://scholar.google.com/citations?user=281EWzQAAAAJ">Chenyu Yan</a><sup>10</sup>, <br><a href="https://scholar.google.com/citations?user=mliv6KEAAAAJ">Guanghao Mei</a><sup>6</sup>, <a href="https://scholar.google.com/citations?user=epTfECgAAAAJ">Jie Zhang</a><sup>1†</sup>, <a href="https://scholar.google.com/citations?user=BLKHwNwAAAAJ">Lefei Zhang</a><sup>5†</sup>
</p>

<p align="center">
  *Equal contribution.<br> †Equal contribution of corresponding author.
</p>

<p align="center">
<a href="https://www.python.org/downloads/release/python-3100/"><img src="https://img.shields.io/badge/python-3.10-blue.svg" alt="Python Version 3.10"></a>
  <a href="https://github.com/Jiaqi-Chen-00/ImBD/issues"><img src="https://img.shields.io/github/issues/Jiaqi-Chen-00/ImBD" alt="GitHub Issues"></a>
  <a href="https://github.com/Jiaqi-Chen-00/ImBD/stargazers"><img src="https://img.shields.io/github/stars/Jiaqi-Chen-00/ImBD" alt="GitHub Stars"></a>
  <a href="https://github.com/Jiaqi-Chen-00/ImBD/network/members"><img src="https://img.shields.io/github/forks/Jiaqi-Chen-00/ImBD" alt="GitHub Forks"></a>
</p>

<p align="center">
| <img src="https://img.icons8.com/color/48/000000/internet.png" alt="Platform" width="15" height="15" style="vertical-align: middle;"/><a href="https://machine-text-detection.github.io/ImBD/"><b>Website</b></a> | <img src="https://img.icons8.com/?size=100&id=13580&format=png&color=000000" alt="Paper" width="15" height="15" style="vertical-align: middle;"/> <a href=""><b>Paper</b></a> | <img src="https://img.icons8.com/?size=100&id=1475&format=png&color=90CAF9" alt="Data" width="15" height="15" style="vertical-align: middle;"/> <a href="https://github.com/Jiaqi-Chen-00/ImBD/tree/main/data"><b>Data</b></a> |
</p>

Detecting **machine-revised text** remains a challenging task as it often involves subtle style changes embedded within human-originated content. The ImBD framework introduces a novel approach to tackle this problem, leveraging **style preference optimization (SPO)** and **Style-CPC** to effectively capture machine-style phrasing. Our method achieves state-of-the-art performance in detecting revisions by open-source and proprietary LLMs like GPT-3.5 and GPT-4o, demonstrating significant efficiency with minimal training data.

We are excited to share our code and data to support further exploration in detecting machine-revised text. We welcome your feedback and invite collaborations to advance this field together!


![Main Figure](https://machine-text-detection.github.io/ImBD/static/images/method.png)

## 🔥 News

- **[2024, Dec 7]** We've released our [Website](https://machine-text-detection.github.io/ImBD).

## 🛠️ Setup
Environment setup
```
conda create -n ImBD python=3.10
conda activate ImBD
pip install -r requirements.txt
```
Download necessary models to ```./models ```
```
bash scripts/download_model.sh
```
## 🚀 Reproduce Results
### Reproduce Our Multi-domain Results
Tuning the model with SPO
```bash
bash scripts/train_spo.sh
```
Eval tuned model on our multi-domain datasets
```bash
# For polish task
bash scripts/eval_spo_polish.sh
# For rewrite task
bash scripts/eval_spo_rewrite.sh
# For expand task
bash scripts/eval_spo_expand.sh
# For generation task
bash scripts/eval_spo_generation.sh
```
### Reproduce Our Multilang Results
The following script will train the model of corresponding language and automatically evaluate the model's result, including **Spanish**, **Portuguese** and **Chinese**.
```bash
bash scripts/train_spo_multilang.sh
```

### Reproduce Other Methods' Results
First Download other models  
```
bash scripts/download_other_models.sh
```
Then Eval other models on our datasets
```bash
# For polish task
bash scripts/eval_other_models_polish.sh
# For rewrite task
bash scripts/eval_other_models_rewrite.sh
# For expand task
bash scripts/eval_other_models_expand.sh
# For generation task
bash scripts/eval_other_models_generation.sh
```
Eval Roberta models on our datasets
```bash
# For four tasks
bash eval_supervised.sh
```
Train and eval sft/rlhf/orpo models on our datasets
```bash
# SFT
python ablation_exp/train_gpt_neo_sft.py
# RLHF
python ablation_exp/train_gpt_neo_rlhf.py
# ORPO
python ablation_exp/train_gpt_neo_orpo.py

# Eval
bash scripts/eval_ablation.sh
```
## 📁 Regenerate Data
### For Opensource Model
Download text-generation models  
**Notes:** You need to first apply for corresponding model download permission and fill the ```HF_TOKEN=``` in the download script, then remove the comments if you need to regenerate the datasets
```
bash scripts/download_other_models.sh
```
Build Data using opensource models
```
bash scripts/build_data.sh
```
### For GPTs
We provide related codes in `tools/data_builder_gpts`. Make sure you fill the api_key and set the right path to save results.

## ✅ TODO

- [ ] Optimize the preservation of the trained model. 
- [ ] Inference code for detection. 
