# Veterinary Automation System

**Project Contributors**  
- 215260016 Yusuf Burak DAĞISTANLI  
- 225260070 Emre ALTUNDAĞ  
- 225260082 Yusuf ŞAKİR  

## Project Requirements
The Veterinary Automation System aims to manage the treatment processes of animals owned by customers, maintain health records for each animal, and track the tasks of veterinarians involved in these processes. This system should provide comprehensive data management, covering customer and animal information as well as treatment and medication details.

## Entities and Attributes

### 1. Customers
- **Customer_ID (PK)**: Unique identifier for the customer.
- **CustomerName**: First name of the customer.
- **CustomerSurname**: Last name of the customer.
- **CustomerPhone**: Phone number of the customer.
- **CustomerAddress**: Address information of the customer.

### 2. Veterinarians
- **Veterinarian_ID (PK)**: Unique identifier for the veterinarian.
- **VeterinarianName**: First name of the veterinarian.
- **VeterinarianSurname**: Last name of the veterinarian.
- **VeterinarianPhone**: Phone number of the veterinarian.

### 3. Medications
- **Medication_ID (PK)**: Unique identifier for the medication.
- **MedicationName**: Name of the medication.
- **MedicationPrice**: Price information of the medication.

### 4. Animals
- **Animal_ID (PK)**: Unique identifier for the animal.
- **AnimalType**: Type of the animal (e.g., cat, dog).
- **AnimalAge**: Age of the animal.
- **AnimalGender**: Gender of the animal.

### 5. Treatments
- **Treatment_ID (PK)**: Unique identifier for the treatment.
- **Veterinarian_ID (FK)**: ID of the veterinarian administering the treatment.
- **TreatmentStartDate**: Start date of the treatment.
- **TreatmentEndDate**: End date of the treatment.
- **Animal_ID (FK)**: ID of the animal receiving the treatment.
- **AnimalIllness**: Information on the animal's illness.
- **Medication_ID (FK)**: ID of the medication used in treatment.
- **MedicationDosage**: Dosage information of the medication.

### 6. Deceased Animals
- **Animal_ID (FK)**: ID of the deceased animal.
- **AnimalDeathDate**: Date of death.
- **AnimalCauseOfDeath**: Cause of death.
- **Treatment_ID (FK)**: ID of the treatment applied to the deceased animal.
- **Customer_ID (FK)**: ID of the animal's owner.

### 7. Recovered Animals
- **Animal_ID (FK)**: ID of the recovered animal.
- **AnimalRecoveryDate**: Date of recovery.
- **Treatment_ID (FK)**: ID of the treatment applied to the recovered animal.
- **Customer_ID (FK)**: ID of the animal's owner.

## Relationships Between Entities

- **Customers - Animals**: A customer can own one or more animals (1..*), but each animal belongs to only one customer (1..1).
- **Veterinarians - Treatments**: A veterinarian can administer one or more treatments (1..*), but each treatment is handled by a single veterinarian (1..1).
- **Animals - Treatments**: An animal can undergo one or more treatments (1..*), but each treatment is specific to a single animal (1..1).
- **Treatments - Medications**: Multiple medications may be used in a treatment process (1..*), and each medication can be used in multiple treatments (1..*).
- **Treatments - Deceased Animals**: When an animal passes away, it is recorded under this category, and each deceased animal has one corresponding treatment record (1..1).
- **Treatments - Recovered Animals**: When an animal recovers, it is recorded under this category, and each recovered animal has one corresponding treatment record (1..1).
- 

![uml](https://github.com/user-attachments/assets/b4f72d2b-1e2c-45cd-bdd4-b42e241954b7)


