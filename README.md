# InstaStories

## Tech Stack ⚙️
- **Architecture:** MVVM (Model-View-ViewModel) with Clean Architecture
- **Programming Language:** Kotlin
- **Dependency Injection:** To be implemented
- **Persistence:** Local storage

## Technical Choices 🛠️
The chosen architecture follows the MVVM pattern combined with Clean Architecture principles. This choice was made because:
- It is **scalable** and easy to maintain.
- It aligns with BeReal's current architecture.
- It ensures a **separation of concerns**, making the code more modular.

### Architecture Layers 🏗️
1. **Presentation Layer:**
   - Contains Views and ViewModels.
2. **Domain Layer:**
   - Contains UseCases and Models.
3. **Data Layer:**
   - Contains Repositories and DataSources.

## Feature List 📝
1. **Carousel for the story list**
2. **Story viewing screen implementation**
3. **Timer for automatic story transition**
4. **Update data when a story is viewed**
5. **Gesture handling for story navigation**
6. **Like/Unlike management** (to be implemented)
7. **Local data persistence** (to be implemented)

## Feature Prioritization 📊
The features are prioritized based on importance and development complexity:
1. Carousel for the story list
2. Story viewing screen implementation
3. Timer for automatic story transition
4. Gesture handling for story navigation
5. Update data when a story is viewed
6. Local data persistence
7. Like/Unlike management

## Implementation Steps
1. Set up the base MVVM and Clean Architecture structure.
2. Implement dependency injection.
3. Define the necessary data structures and models.
4. Develop screens with mock data.
5. Integrate real data. (To be implemented)
6. Implement unit tests. (To be implemented)
7. Write documentation (including this README).

## Potential Improvements 🚀
- Implement **Factory patterns** for managing dependency creation.
- Add **unit tests** to ensure code reliability.
- Split **UseCases into smaller units** for better readability and easier testing.
- Create a **DIConfig** for previews and testing purposes.
- Replace **AsyncImage** with image downloading and caching mechanism to improve performance.
- Implement **local data persistence** for offline access.
