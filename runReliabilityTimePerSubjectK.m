% Test script for reliabilities

addpath(genpath('.'));

% Kaneshiro data
load('/home/groups/amnorcia/eeg_data/kaneshiro_data/kaneshiro_eeg.mat');

% Permute dimensions so (num_images, num_subjects, num_trials, num_timepoints, num_components)
eeg_data = permute(eeg_data, [2,1,3,5,4]);

num_images = size(eeg_data,1);
num_subjects = size(eeg_data,2);
num_trials = size(eeg_data,3);
num_timepoints = size(eeg_data,4);
num_components = size(eeg_data,5);

all_subj = zeros(num_subjects, num_timepoints, 10, num_components);
for i=1:num_subjects
    fprintf('Subject %d\n', i);
    eeg_data_subj = squeeze(eeg_data(:,i,:,:,:));
    eeg_data_subj = reshape(eeg_data_subj, [num_images*num_trials, num_timepoints, num_components]);
    labels = repmat(1:72, [1,num_trials]);

    disp(size(eeg_data));
    disp(size(labels));

    eeg_data_subj = permute(eeg_data_subj, [3,2,1]);
    
    rel_time = computeSpaceTimeReliability(eeg_data_subj, labels, 10);
    all_subj(i,:,:,:) = rel_time;
end

save('results/all_subj_k_08Aug19.mat', 'all_subj');

