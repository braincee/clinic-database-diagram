CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  date_of_birth DATE,
  PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(250),
  PRIMARY KEY (id)
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(250),
  name VARCHAR(250),
  PRIMARY KEY (id)
);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_histories_id INT,
  PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  PRIMARY KEY (id)
);

ALTER TABLE medical_histories ADD CONSTRAINT fk_medical-history_patients FOREIGN KEY (patient_id) REFERENCES patients(id);

ALTER TABLE invoices ADD CONSTRAINT fk_invoices_medical_history FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id);

ALTER TABLE invoice_items ADD CONSTRAINT fk_invoice_items_invoices FOREIGN KEY (invoice_id) REFERENCES invoices(id);

ALTER TABLE invoice_items ADD CONSTRAINT fk_invoice_items_treatment FOREIGN KEY (treatment_id) REFERENCES treatments(id);