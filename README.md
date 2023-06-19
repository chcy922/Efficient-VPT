# AI System Final project [Team NBAI]
Memory optimization for Visual Prompt Tuning

This repository is forked from offiacl repository of contains the official PyTorch implementation for "Visual Prompt Tuning" [ECCV 2022] : [KMnp/vpt](https://github.com/KMnP/vpt).


## Structure of the this repo (key files are marked with 👉):

- `src/configs`: handles config parameters for the experiments.
  
  * 👉 `src/config/config.py`: <u>main config setups for experiments and explanation for each of them. </u> 

- `src/data`: loading and setup input datasets. The `src/data/vtab_datasets` are borrowed from 


- `src/engine`: main training and eval actions here.

- `src/models`: handles backbone archs and heads for different fine-tuning protocols 
    * 👉`src/models/vit_backbones`: <u>a folder containing vit.py in which applied flash attention and gradient checkpointing could be find.</u>
    * 👉`src/models/vit_prompt`: <u>a folder contains the same backbones in `vit_backbones` folder,</u> specified for VPT. This folder should contain the same file names as those in  `vit_backbones`

    * 👉 `src/models/vit_models.py`: <u>main model for transformer-based models</u> ❗️Note❗️: Current version only support ViT, Swin and ViT with mae, moco-v3

    * `src/models/build_model.py`: main action here to utilize the config and build the model to train / eval.

- `src/solver`: optimization, losses and learning rate schedules.  
- `src/utils`: helper functions for io, loggings, training, visualizations. 
- 👉`train.py`: call this one for training and eval a model with a specified transfer type.
- `launch.py`: contains functions used to launch the job.



- The datasets can be downloaded following the official links. We split the training data if the public validation set is not available. The splitted dataset can be found here: [Dropbox](https://cornell.box.com/v/vptfgvcsplits), [Google Drive](https://drive.google.com/drive/folders/1mnvxTkYxmOr2W9QjcgS64UBpoJ4UmKaM?usp=sharing). 

  - [CUB200 2011](http://www.vision.caltech.edu/visipedia/CUB-200-2011.html)

  - [Oxford Flowers](https://www.robots.ox.ac.uk/~vgg/data/flowers/)

  
### Pre-trained model preperation

Download and place the pre-trained Transformer-based backbones to `params`. Note that you also need to rename the downloaded ViT-B/16 ckpt from `ViT-B_16.npz` to `sup-ViT-B.npz`.

<table><tbody>
<!-- START TABLE -->
<!-- TABLE HEADER -->
<th valign="bottom">Pre-trained Backbone</th>
<th valign="bottom">Pre-trained Objective</th>
<th valign="bottom">Link</th>
<th valign="bottom">md5sum</th>
<!-- TABLE BODY -->
<tr><td align="left">ViT-B/16</td>
<td align="center">Supervised</td>
<td align="center"><a href="https://storage.googleapis.com/vit_models/imagenet21k/ViT-B_16.npz">link</a></td>
<td align="center"><tt>d9715d</tt></td>
</tr>
<tr><td align="left">ViT-L/16</td>
<td align="center">Supervised</td>
<td align="center"><a href="https://storage.googleapis.com/vit_models/imagenet21k/ViT-L_16.npz">link</a></td>
<td align="center"><tt>d9715d</tt></td>
</tr>
</tbody></table>

### Run experiments
If you want to run with Flash Attention for ViT-B/16 on CUB dataset with 100 prompt tokens and image size 224, execute
```
bash run.sh sup_vitb16 cub 224 100 True False
```