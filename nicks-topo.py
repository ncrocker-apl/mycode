#!/usr/bin/python3
"""Alta3 Research | Custom topology example

   Two directly connected switches plus a host for each switch:

      host --- switch --- switch --- host

   Adding the 'topos' dict with a key/value pair to generate our newly defined
   topology enables one to pass in '--topo=mytopo' from the command line.
   """

from mininet.topo import Topo

class NewTopo( Topo ):
       "Simple topology example."

       def __init__( self ):
           "Create custom topo."

           # Initialize topology
           Topo.__init__( self )

           # Add hosts and switches
           leftHost1 = self.addHost( 'h1' )
           bottomHost1 = self.addHost( 'h2' )
           bottomHost2 = self.addHost( 'h3' )
           rightHost1 = self.addHost( 'h4' )
           topHost1 = self.addHost( 'h5' )
           topHost2 = self.addHost( 'h6' )
           centerSwitch = self.addSwitch( 's1' ) 
           leftSwitch = self.addSwitch( 's2' ) 
           rightSwitch = self.addSwitch( 's3' )

           # Add links
           self.addLink( leftHost1, leftSwitch )
           self.addLink( bottomHost1, leftSwitch )
           self.addLink( bottomHost2, rightSwitch )
           self.addLink( rightHost1, rightSwitch )
           self.addLink( topHost1, centerSwitch )
           self.addLink( topHost2, centerSwitch )
           self.addLink( leftSwitch, centerSwitch )
           self.addLink( rightSwitch, centerSwitch )


topos = { 'newtopo': ( lambda: NewTopo() ) }

