
startup;

reference_joints_pair = [6, 4];     % right shoulder and left hip (from observer's perspective)
% symmetry_joint_id(i) = j, if joint j is the symmetry joint of i (e.g., the left
% shoulder is the symmetry joint of the right shoulder).
symmetry_joint_id = [1,3,2,5,4,7,6];
joint_name = {'Head', 'Wris', 'Elbo', 'Shou'};

symmetry_part_id = [3,4,1,2];
part_name = {'U.arms', 'L.arms'};

%% Evaluate FLIC (Person Centric)
load('/home/ai/code/caffe-heatmap/matlab/pose/fliclabel.mat', 'labels'); % load original parse labels
eval_name = 'FLIC';

% eval PCP
load('/home/ai/code/caffe-heatmap/matlab/pose/flic_test2_1.mat', 'joints');
eval_pcp(joints, labels, symmetry_part_id, part_name, eval_name);

% eval PCK
% load('/home/ai/code/caffe-heatmap/matlab/pose/paperjoints.mat', 'joints');
% eval_pck(joints, labels, symmetry_joint_id, joint_name, eval_name);
open('/home/ai/Desktop/figandim/flic_elbows.fig');

% eval PDJ
 eval_pdj(joints, labels, reference_joints_pair, symmetry_joint_id, joint_name, eval_name);