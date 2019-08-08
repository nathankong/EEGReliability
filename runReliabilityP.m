% Test script for reliabilities

addpath(genpath('.'));

% Pantazis data
load('/home/groups/amnorcia/eeg_data/pantazis_data/pantazis_eeg.mat');

% Permute dimensions so (num_images, num_subjects, num_trials, num_timepoints, num_components)
eeg_data = permute(eeg_data, [2,1,3,5,4]);

num_images = size(eeg_data,1);
num_subjects = size(eeg_data,2);
num_trials = size(eeg_data,3);
num_timepoints = size(eeg_data,4);
num_components = size(eeg_data,5);

eeg_data = reshape(eeg_data, [num_images, num_subjects*num_trials, num_timepoints, num_components]);
eeg_data = reshape(eeg_data, [num_images*num_subjects*num_trials, num_timepoints, num_components]);
labels = repmat(1:72, [1,num_subjects*num_trials]);
disp(size(eeg_data));
disp(size(labels));

eeg_data = permute(eeg_data, [3,2,1]);

rel_trials = computeSampleSizeReliability(eeg_data, labels, 16, 1:100, 10, 100);
save('results/rel_trials_p_16_08Aug19.mat', 'rel_trials');

