class Item extends React.Component{
    constructor(props){
        super(props)
        this.state={
            name:'',
            description:'',
            editable:false
        }
    }
    setValuesOfName(event) {
        this.setState({ name: (event.target.value) });
    }
    setValuesOfDescription(event) {
        this.setState({ description: (event.target.value) });
    }
    handleEdit(){
        if (this.state.editable) { 
            var name = this.state.name; 
            var description = this.state.description;
            var id =  this.props.item.id
            var item = {id: id,name:name,description:description};
            this.props.handleUpdate(item);
        }
        this.setState({ editable: !this.state.editable })
    }
    onUpdate(item){
        this.props.onUpdate(item);
    }
    render(){
        var name = this.state.editable? <input type='text' defaultValue = {this.props.item.name} onChange={this.setValuesOfName.bind(this)}/>: <h3>{this.props.item.name}</h3>;
        var description = this.state.editable ? <input type='text' defaultValue={this.props.item.description} onChange={this.setValuesOfDescription.bind(this)}/> : <p>{this.props.item.description}</p>;
        return(
            <div>
                {name}
                {description}
                <button onClick={this.props.handleDelete.bind(this)}>Delete</button>
                <button onClick={this.handleEdit.bind(this)}> {this.state.editable ? 'Submit' : 'Edit'}</button>
            </div>
        )
    }
}