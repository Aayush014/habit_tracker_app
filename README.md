# Habit Tracker App
Welcome to the Habit Tracker App! This app is designed to help you build and maintain habits by providing a simple and effective way to track your progress.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction

The Habit Tracker App is a tool to help you monitor and achieve your daily goals. Whether you're trying to build new habits or break old ones, this app provides an easy-to-use interface to track your progress and stay motivated.

## Features

- **Habit Creation**: Easily create and manage multiple habits.
- **Progress Tracking**: Visualize your progress with calendar views and charts.
- **Statistics**: Get detailed insights into your habit-building journey.

## Installation

To run this project locally, follow these steps:

1. **Clone the repository**
    ```bash
    git clone https://github.com/Aayush014/habit_tracker_app.git
    ```

2. **Install dependencies**
    ```bash
    flutter pub get
    ```

3. **Run the app**
    ```bash
    flutter run
    ```

## Usage

1. **Create Habits**: Add new habits you want to track.
2. **Track Progress**: Mark habits as completed and view your progress over time.


  <details>
  <summary><h2>Expected Output</h2></summary>


  - **AppBar** :
    - The app bar at the top will be transparent and without elevation, giving it a minimalistic look.
   
  - **Body** :
    - The main body of the `Scaffold` will contain a `ListView` with a heatmap at the top and a list of habits below it.
    - **HeatMap**: The heatmap will be displayed, showing the habit completion over time with color intensities representing the frequency of habit completion.
    - **Habit List**: Below the heatmap, there will be a list of habits, each represented by a custom `MyHabitTile` widget.
   
  - **Floating Action Button** :
    - A custom floating action button will be centered at the bottom, containing three buttons:
        - A button to create a new habit, labeled "New Habit" with an add icon.
        - A button to toggle between dark and light themes with an animated sun/moon icon.
        - A button for settings, with a settings icon.
## UI Elements in Detail  

  - **HeatMap** :
    - Displays the frequency of habit completion.
    - Color intensity increases with the frequency (e.g., various shades of blue).
    - Adapted to the current theme (dark or light).

  - **Habit List** :
    - Each habit is represented by a tile that shows the habit name and its completion status for the current day.
    - Options to edit or delete each habit are available through the tile.
    
  - **Floating Action Button** :
    - The main container has a black background and rounded corners.
    - The "New Habit" button is blue and rounded, positioned on the left.
    - The theme toggle button is in the middle and animated.
    - The settings button is on the right.
   
## User Interactions
  - **Creating a New Habit** :
    - Tapping the "New Habit" button will open a dialog with a text field to enter the name of the new habit.
    - "Save" will add the habit to the list, while "Cancel" will close the dialog without adding.
   
  - **Editing a Habit** :
    - Each habit tile has an edit button that, when pressed, opens a dialog to edit the habit name.
     
  - **Deleting a Habit** :
    - Each habit tile has a delete button that, when pressed, opens a confirmation dialog to delete the habit.
     
  - **Toggling Theme** :
    - Tapping the theme toggle button will switch between dark and light themes with an animation.
</details>

## Screenshots📸

  <p>
    <table align="center">
  <tr>
    <td><img src="https://github.com/Aayush014/custom-readme/assets/133498952/1a8b623e-1fa2-433a-94d4-590ed623546b" alt="Image 2" width="180" height="auto"></td>
    <td><img src="https://github.com/Aayush014/custom-readme/assets/133498952/5b88f5e2-469f-4488-82ae-c4be375c7ce6" alt="Image 2" width="180" height="auto"></td>
    <td><img src="https://github.com/Aayush014/custom-readme/assets/133498952/1f6e6194-2668-467f-808c-be8677c93b25" alt="Image 2" width="180" height="auto"></td>
  </tr>
  <tr>
    <td><img src="https://github.com/Aayush014/custom-readme/assets/133498952/34865924-a54a-4927-bf3f-274c2ac552d5" alt="Image 2" width="180" height="auto"></td>
    <td><img src="https://github.com/Aayush014/custom-readme/assets/133498952/6a46fccf-3f89-48c5-8965-136923a1fbd8" alt="Image 2" width="180" height="auto"></td>
    <td><img src="https://github.com/Aayush014/custom-readme/assets/133498952/95c7eac1-5dcc-46e1-851c-d1f9133a1cc1" alt="Image 2" width="180" height="auto"></td>
  </tr>
    </table>    
  </p>

  <p>
    <table align="center">
  <tr>
    <video src ="https://github.com/Aayush014/habit_tracker_app/assets/133498952/e10df6da-340f-4832-9536-1be47f636b38"></video> </h1>
  </tr>
    </table>   
  </p>

  ## Contributing

Contributions are welcome! If you have any ideas, suggestions, or issues, feel free to open an issue or create a pull request.

1. **Fork the repository**
2. **Create your feature branch** (`git checkout -b feature/YourFeature`)
3. **Commit your changes** (`git commit -m 'Add some feature'`)
4. **Push to the branch** (`git push origin feature/YourFeature`)
5. **Open a pull request**

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions or suggestions, feel free to reach out to us at:

- Email: aayushpatel01411@gmail.com
- GitHub: [Aayush014](https://github.com/Aayush014)

Thank you for using the Habit Tracker App! We hope it helps you achieve your goals and build better habits.
