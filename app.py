from flask import Flask, render_template, redirect, url_for
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:password@localhost/cdb1'
db = SQLAlchemy(app)

class Criminal(db.Model):
    CriminalID = db.Column(db.Integer, primary_key=True)
    CriminalName = db.Column(db.String(100), nullable=False)
    Dob = db.Column(db.Date)
    Age = db.Column(db.Integer)
    Records = db.Column(db.String(200))
    Address = db.Column(db.String(200))
    Nationality = db.Column(db.String(200))
    # Add more columns if needed

class Victim(db.Model):
    VictimID = db.Column(db.Integer, primary_key=True)
    VictimName = db.Column(db.String(100), nullable=False)
    Dob = db.Column(db.Date)
    Age = db.Column(db.Integer)
    Address = db.Column(db.String(200))
    Contact = db.Column(db.String(100), unique=True)
    # Add more columns if needed

class Crime(db.Model):
    CrimeID = db.Column(db.Integer, primary_key=True)
    CrimeType = db.Column(db.String(100), nullable=False)
    CrimeDate = db.Column(db.Date, nullable=False)
    CrimeTime = db.Column(db.Time, nullable=False)
    CrimeDesc = db.Column(db.String(100))
    Latitude = db.Column(db.DECIMAL(10, 6))
    Longitude = db.Column(db.DECIMAL(10, 6))
    Severity = db.Column(db.String(100))
    CriminalID = db.Column(db.Integer, db.ForeignKey('criminal.CriminalID'))
    VictimID = db.Column(db.Integer, db.ForeignKey('victim.VictimID'))
    # Add more columns if needed

class PersonalDescription(db.Model):
    Gender = db.Column(db.Enum('Male', 'Female', 'Other'))
    Height = db.Column(db.DECIMAL(10, 6))
    Weight = db.Column(db.DECIMAL(10, 6))
    IdentificationMarks = db.Column(db.TEXT)
    CriminalID = db.Column(db.Integer, db.ForeignKey('criminal.CriminalID'), primary_key=True)
    VictimID = db.Column(db.Integer, db.ForeignKey('victim.VictimID'), primary_key=True)
    # Add more columns if needed

class Evidence(db.Model):
    EvidenceID = db.Column(db.Integer, primary_key=True)
    ItemType = db.Column(db.String(100), nullable=False)
    Description = db.Column(db.TEXT)
    CollectionDate = db.Column(db.Date)
    Source = db.Column(db.String(255))
    CollectionOfficerName = db.Column(db.String(255))
    CollectionOfficerContact = db.Column(db.String(100))
    CrimeID = db.Column(db.Integer, db.ForeignKey('crime.CrimeID'))
    # Add more columns if needed

class LawEnforcementAgency(db.Model):
    AgencyID = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(255), nullable=False)
    Locality = db.Column(db.String(255))
    Contact = db.Column(db.String(100))
    EvidenceID = db.Column(db.Integer, db.ForeignKey('evidence.EvidenceID'))
    CrimeID = db.Column(db.Integer, db.ForeignKey('crime.CrimeID'))
    # Add more columns if needed

class InvestigatingTeam(db.Model):
    TeamID = db.Column(db.Integer, primary_key=True)
    SketchArtists = db.Column(db.String(255), nullable=False)
    LeadInspector = db.Column(db.String(255))
    ForensicSpecialists = db.Column(db.String(255))
    Interrogator = db.Column(db.String(255))
    SpecialisedUnits = db.Column(db.String(255))
    LegalAdvisor = db.Column(db.String(255))
    AgencyID = db.Column(db.Integer, db.ForeignKey('law_enforcement_agency.AgencyID'))
    # Add more columns if needed


class LoginForm(FlaskForm):
    username = StringField('Username')
    password = PasswordField('Password')
    submit = SubmitField('Login')

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        # In a real application, you would validate the username and password
        # and redirect based on the authentication result.
        return redirect(url_for('home'))
    return render_template('login.html', form=form)

if __name__ == '__main__':
    app.run(debug=True)
