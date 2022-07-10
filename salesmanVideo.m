

% [~,lengthSavedRandomTour] = size(savedRandomTour);

for t=1:length(savedRandomTour)
    figure(7)
%     scatter(citiesMat(1 : noCities, 1), citiesMat(1 : noCities, 2), 'o'); hold on;
    plot(citiesMat(savedRandomTour(t,:), 1), citiesMat(savedRandomTour(t,:), 2), '-'); grid on;
    hold on
    plot(citiesMat(savedRandomTour(t,:), 1), citiesMat(savedRandomTour(t,:), 2), 'x');
           hold off
%     grid on
    xlabel('Coordinates');
    ylabel('Coordinates');
    xlim([-1 10])
    ylim([-1 5])
    title(t*50);
    drawnow
    aa = 1;
%     pause(0.018)
end



% figure
% scatter(citiesMat(1 : noCities, 1), citiesMat(1 : noCities, 2), 'o'); hold on;
% plot(citiesMat(optimalTour, 1), citiesMat(optimalTour, 2), '-'); grid on;
% xlabel('Coordinates');
% ylabel('Coordinates');
% title('Optimal Tour of Traveling Salesman Problem');