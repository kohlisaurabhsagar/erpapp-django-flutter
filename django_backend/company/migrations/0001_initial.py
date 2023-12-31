# Generated by Django 4.2.8 on 2023-12-14 10:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Company",
            fields=[
                ("company_id", models.AutoField(primary_key=True, serialize=False)),
                ("company_name", models.CharField(max_length=50)),
                ("company_address", models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name="Doctor",
            fields=[
                ("doctor_id", models.AutoField(primary_key=True, serialize=False)),
                ("doctor_name", models.CharField(max_length=50)),
                ("doctor_age", models.IntegerField()),
                (
                    "company",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="company.company",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Customer",
            fields=[
                ("customer_id", models.AutoField(primary_key=True, serialize=False)),
                ("customer_name", models.CharField(max_length=50)),
                ("customer_age", models.IntegerField()),
                (
                    "company",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="company.company",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Chemist",
            fields=[
                ("chemist_id", models.AutoField(primary_key=True, serialize=False)),
                ("chemist_name", models.CharField(max_length=50)),
                ("chemist_age", models.IntegerField()),
                (
                    "company",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="company.company",
                    ),
                ),
            ],
        ),
    ]
