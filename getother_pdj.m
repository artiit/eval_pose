open('/home/ai/Desktop/figandim/flic_wrists.fig');
lh = findall(gca, 'type', 'line');
xc = get(lh, 'xdata');
yc = get(lh, 'ydata');