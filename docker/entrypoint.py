#!/usr/bin/env python3
import os
from glob import glob

import numpy as np
import pandas as pd

from photonai.base import Hyperpipe
from photonai_neuro import BrainMask
from photonai_neuro.nifti_transformations import ResampleImages


def main():
    df = pd.read_csv('/input/input.csv', index_col='subject')
    files = df['cat12_image'].to_list()

    # extract brain data
    resample_images = ResampleImages(voxel_size=3, interpolation='nearest', output_img=True)
    print('Resampling images...')
    X = resample_images.transform(files)
    brain_mask = BrainMask(mask_image='MNI_ICBM152_GrayMatter', affine=None, shape=None, mask_threshold=0.5,
                           extract_mode='vec')
    print('Brainmasking images...')
    X = brain_mask.transform(X)
    my_pipe = Hyperpipe.load_optimum_pipe("photon_best_model.photon")
    y = my_pipe.predict(X)
    print('Predicting...')
    y_df = pd.DataFrame(y)
    y_df['file'] = files
    y_df.to_csv('/output/raw_predictions.csv')


if __name__ == '__main__':
    main()
