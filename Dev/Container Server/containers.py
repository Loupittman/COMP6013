from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_restful import Api, Resource, reqparse

app = Flask(__name__)
api= Api(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://18059081:dn46d93bnmxx@localhost/container_identification'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)


class Container(db.Model):
    id = db.Column(db.Integer(), primary_key=True)
    container_id = db.Column(db.String(12), unique=True, nullable=False)
    type = db.Column(db.String(30))
    description = db.Column(db.String(256))
    vle = db.Column(db.String(16))
    model_mix = db.Column(db.String(45))
    empties_storage = db.Column(db.String(45))
    empties_lane = db.Column(db.String(30))
    jis_route = db.Column(db.String(8))
    length = db.Column(db.Numeric(10, 1))
    width = db.Column(db.Numeric(10, 1))
    height = db.Column(db.Numeric(10, 1))
    weight = db.Column(db.Numeric(10, 1))
    haulier_id = db.Column(db.Integer())
    load_unit_id = db.Column(db.Integer())


containers_put_args = reqparse.RequestParser()
containers_put_args.add_argument("id", type=int, help="container ID")
containers_put_args.add_argument("type", type=str, help="type of container")
containers_put_args.add_argument("description", type=str, help="container description")

containers = {}


class ContainerTest(Resource):
    def get(self, container_id):
        return containers[int(container_id)]

    def put(self, container_id):
        args = containers_put_args.parse_args()
        return{container_id: args}


api.add_resource(ContainerTest, "/containertest/<container_id>")


@app.route("/")
def hello_world():
    container = Container.query.filter_by(id=200).first()
    return (
        f'<p>Hello, World!</p>\n'
        f'<p>Query result: {container.description}</p>'
    )

