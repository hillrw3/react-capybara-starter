import React from 'react'
import App from "./App";

describe('Home Page', () => {
    it('renders', () => {
        const app = shallow(<App/>)

        expect(app).not.toBeNull()
    })
})