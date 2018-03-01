class NewItem extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            name:'',
            description: ''
        }
    }
    setValuesOfName(event){
        this.setState({name:(event.target.value)});
    }
    setValuesOfDescription(event) {
        this.setState({description:(event.target.value)});
    }
    handleClick(){
        document.getElementById('Name').value = ''
        document.getElementById('Description').value = ''
        var name= this.state.name;
        var description = this.state.description;
        $.ajax({
            url: '/api/v1/items',
            type: 'POST',
            data: {item: {name: name,description: description}},
            success:(response) => {
                this.props.handleSubmit(response);
            }
        })
    }
    
    render(){
        return(
            <div>
                <input id="Name" placeholder="Enter the name of the item" onChange={this.setValuesOfName.bind(this)} />
                <input id="Description" placeholder="Enter a Description" onChange={this.setValuesOfDescription.bind(this)}/>
                <button onClick={this.handleClick.bind(this)}>Submit</button>
            </div>
        )
    }
}