close all
clear all
clc

coolingFactor = 0.001;
temperatureStart = 1000;
noCities = 8;


% citiesMat = unifrnd(0, 1000, noCities, 2);
citiesMat = [0 1
    0 2
    0 0
    1 2
    1 0
    2 0
    2 1
    2 2];
distance_mat = squareform(pdist(citiesMat));
temperature = temperatureStart;
distancePrev = Inf;
counter = 0;
randomTour = randperm(noCities);
%% simulated annealing process as long as temperature is positive

while temperature > 1

    % below code randomly swaps to cities in the tour. This it the
    % most efficient stochastic method of simulating all possible tours.

    tourPosition1 = round(unifrnd(1, noCities));
    tourPosition2 = round(unifrnd(1, noCities));
    % randomly select two tour positions from current random tour

    swapCity1 = randomTour(tourPosition1);
    swapCty2 = randomTour(tourPosition2);
    % extract the cities at these random positions

    randomTour(tourPosition1) = swapCty2;
    randomTour(tourPosition2) = swapCity1;
    % swap the cities

    tourDistance = 0;
    % reinitialize the tour distance for each iteration

    % calculate the sum of intercity distance along the current random
    % route
    for i = 1 : noCities - 1
        tourDistance = tourDistance + distance_mat(randomTour(i), randomTour(i + 1));
    end

    difference = tourDistance - distancePrev;
    % calculate the differnece between current random tour and previous
    % random tour

    if(difference < 0 | exp(-difference / temperature) > rand(0, 1))
        distancePrev = tourDistance;
        optimalTour = randomTour;
    end

    counter = counter + 1;
    % counter variable to track iterations

    temperature_vec(counter, :) = temperature;
    % vector tracks annealing temperature at each iteration

    temperature = temperature * (1 - coolingFactor);
    % cool the process by discounting temperatuee by cooling factor

    optim_distance(counter, :) = distancePrev;
    calc_distance(counter, :) = tourDistance;
    % vectors to store the current optimal distance as well as currently
    % computed distance
end

%% Plot of results

plot(1: 1: counter, temperature_vec, '-', 'Linewidth', 2);
xlabel('Number of Steps');
ylabel('Temperature');
title('Decay of Annealing Temperature');
% plot of annealing temperature vs iterations

figure
plot(1: 1: counter, optim_distance, '-', 'Linewidth', 2); 
% plot(1: 1: counter, calc_distance, '-', 'Linewidth', 2);
xlabel('Number of Steps');
ylabel('Distance');
title('Simulated Annealing of Traveling Salesman Problem');
% Plot of calculated distcance and currently optimal distance vs.
% iterations

figure
scatter(citiesMat(1 : noCities, 1), citiesMat(1 : noCities, 2), 'o'); hold on;
plot(citiesMat(optimalTour, 1), citiesMat(optimalTour, 2), '-'); grid on;
xlabel('Coordinates');
ylabel('Coordinates');
title('Optimal Tour of Traveling Salesman Problem');
% plot of city coordinates and optimal route