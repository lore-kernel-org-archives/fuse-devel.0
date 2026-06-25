Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004B637C930
	for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 22:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782425846; cv=none; b=GmqLS+ZtkfYXnxaZyx7CIYdVyhwfuqDqUuMOq05LMlszj2raENwuwnNBH8OqxCHq9L26hhXr544hZEzkVlUKLAkKMMnidG3mz7cRAfaAKwUWXzCHonZN0JIepDGGDNWeLHVjtrPeYUZv7jjUMhdrdINkGW2Nj+0k+0fULnNPa3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782425846; c=relaxed/simple;
	bh=XWV+3wzoy6/RRo2YuLxuNbPtkD3aq+Y1/2OOLS65p1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GVtFsqE9/pQgIuK85IBIJqY1w+WxP1XGqy8P6eT2WadIx/pDwqvE0kC5tzMYxsGC4fPzGtwRuXm7WVkPYu8g0YJVxnEhuv9YsqpscylMBrmiiRZqR/bfmQSxgTQLZhc+vBGL0sVL+lb8rauaVqzyBfs76P++mMb0nKsTlOwW2bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fo8bAkt9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fo8bAkt9"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 88E681F000E9;
	Thu, 25 Jun 2026 22:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782425843;
	bh=ljgKvSzzocZHIOV2C0MGRDqbMV8W51D4E6meqM/EVxQ=;
	h=Date:From:To:Cc:Subject;
	b=fo8bAkt9nYied+UWRHzNdRs7JFWZVAIR/Uu6/c1LME7ZNVhKiIAuU36A7KjL+u7Z7
	 HqH0J5VI/iPm9pZLcACra8Ubcm219aENTRrrDI4qnxaeO6u6ovBOlfSOhOljJHS0uk
	 CiLwckr0J0AAwT8/O/XffSlHiaiw/OdDLHYxc6qEaOC3vvtyaHxfBaDAEUXfLpL26W
	 4AAIowAKgj3mnsCAbiCc+y3HZTBE2dk/u7Z097DB6WayYFJpR7FUt7PBXsOFU0/yBH
	 IAwVd+W0977bdQm3deBSwx3sZL2B1EOyj11L+CmL7WieFO36l3ZMQw5VLEuB8WqVCj
	 GqQH5B72K5n0w==
Date: Thu, 25 Jun 2026 15:17:22 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com, Neal Gompa <neal@gompa.dev>
Cc: fuse-devel@lists.linux.dev
Subject: [REVIEW] libfuse: Improve documentation for fuse service mount
Message-ID: <20260625221722.GV6070@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hey everyone,

Bernd asked me to review a documentation pull request from:
https://github.com/bsbernd/libfuse/tree/fuse-service-doc

So I'll go through it line by line. :)

> From: Bernd Schubert <bernd@bsbernd.com>
> Date: Sat, 20 Jun 2026 15:48:20 +0200
> Subject: Improve documentation for fuse service mount
> 
> Improve end user and add developer information.
> 
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> 
> diff --git a/doc/README.service-mount b/doc/README.service-mount
> new file mode 100644
> index 00000000000000..5e6a0a95802158
> --- /dev/null
> +++ b/doc/README.service-mount
> @@ -0,0 +1,274 @@
> +Mounting FUSE filesystems that run as a socket service
> +======================================================
> +
> +This document is for administrators and end users who want to mount a FUSE
> +filesystem whose server runs as a sandboxed systemd socket service, rather
> +than as a process in the mount caller's own context.
> +
> +Developers who want to make their FUSE server runnable this way should read
> +README.service-mount-dev instead.
> +
> +
> +What a service mount is
> +-----------------------
> +
> +A traditional FUSE filesystem runs as a child of whoever mounts it: it
> +inherits that environment, needs mount permission, and can see the caller's
> +files. A *service mount* instead keeps the FUSE server running as an
> +independent systemd service. When someone mounts the filesystem, a small
> +privileged helper (fuservicemount3) connects to the service over a UNIX
> +socket, hands it the /dev/fuse device and any backing files it needs, and
> +performs the mount(2) on its behalf.
> +
> +The benefit is isolation. The server can run:
> +
> +  - as a separate, unprivileged uid/gid (systemd DynamicUser),
> +  - with no capabilities at all,
> +  - in private mount, network, and pid namespaces,
> +  - with a restricted system-call filter,
> +
> +while still being mountable by an ordinary user. The server never gains mount
> +permission and never runs in the caller's environment; the privileged work is
> +confined to the fuservicemount3 helper. See example/service_ll@.service for a
> +fully locked-down unit.

<nod>

> +Do I need this?
> +---------------
> +
> +This feature exists for one specific goal: running a FUSE server with strong
> +privilege separation, where the server itself is fully unprivileged and
> +sandboxed while a separate setuid helper performs the mount. Getting that
> +requires the server to be written to the fuse_service_* API (see
> +README.service-mount-dev). An existing FUSE program that simply calls
> +fuse_main() cannot be mounted this way unmodified: it opens /dev/fuse and
> +performs the mount itself, which the sandbox does not allow.
> +
> +If all you want is to manage an ordinary FUSE filesystem with systemd --
> +start/stop, automatic restart, journald logging, cgroup resource limits --
> +you do NOT need this feature. Run the filesystem under a plain systemd service
> +unit instead, launching it in the foreground so systemd can track it:
> +
> +    # myfs.service
> +    [Service]
> +    ExecStart=/usr/bin/myfs ... -f <mountpoint>

I think any user who wants to mount a fuse filesystem without the
service mount stuff would be better off doing it via systemd-run:

$ sudo systemd-run -p SystemdDirective=value... myfs <args> $mountpt

since you can easily pass as many CLI args as you want.  I think that
even works in the user's session:

$ systemd-run --user -p SystemdDirective=value... myfs <args> $mountpt

as long as fusermount3 is present and setuid.

Regular systemd services don't allow passing of parameters, and instance
services (i.e. myfs@.service with the at-sign) only allow one parameter.

<shrug> That said, what you've written here is technically correct so I
have no problem with that.

(I guess you mention this later on too, so we're all good here)

> +That filesystem still mounts the traditional way (through fusermount3) and
> +runs in the service's own context; it is not isolated from the mount the way a
> +service mount is.
> +
> +Use a service mount when you specifically want:
> +
> +  - the filesystem server to run as a separate, unprivileged uid with no
> +    mount permission of its own,
> +  - it confined to private mount/network/pid namespaces with no capabilities,
> +  - the privileged mount work isolated in the fuservicemount3 helper,
> +  - on-demand, socket-activated startup.
> +
> +In short: a plain systemd unit gives you lifecycle management; a service mount
> +gives you lifecycle management AND isolation, at the cost of adapting the
> +server to the service API.

"...at the cost of the fuse server author adapting the server..."

> +
> +
> +Requirements
> +------------
> +
> +Service mount support is only built when libfuse is configured with systemd
> +support:
> +
> +  - the systemd development headers (libsystemd-dev), and
> +  - a known systemd system unit directory.
> +
> +When both are present, meson defines HAVE_SERVICEMOUNT and builds the
> +fuservicemount3 helper. If either is missing, meson prints a warning and the
> +feature is left out; mounts then fall back to the traditional path (see
> +"Dispatch and fallback" below).
> +
> +Relevant meson options:
> +
> +  - service-socket-dir    directory that holds the per-filesystem service
> +                          sockets (default: /run/filesystems)
> +  - service-socket-perms  mode for the socket files (default: 0220)
> +  - systemd-system-unit-dir
> +                          where to install service/socket units (default:
> +                          taken from the systemd pkg-config file)
> +
> +fuservicemount3 is installed setuid root, just like fusermount3, so that
> +unprivileged users can trigger a mount handled by the service. The setuid
> +privilege is what lets it perform the mount; it drops back to the real user
> +before connecting to the service socket, so the socket's own permissions are
> +what decide who may mount. The default 0220 mode is only a starting point --
> +set the socket's owner, group, or ACL to grant the intended users access (see
> +"Who establishes the connection" below).

Shouldn't this be in the README.service-mount-dev file?  Users/sysadmins
can discover if the service mount support is enabled for a specific
filesystem with:

$ fuservicemount3 --check -t myfs && echo YES
YES

(oh, you mention that later; this synopsis is fine here as it is)

> +
> +
> +Installing a service
> +--------------------

Hrm.  Or maybe we've a misunderstanding here.  I think if a fuse server
author wants to support servicemount, then they (and not the end users)
have to:

1) Modify their fuse_server to call the fuse_service_* APIs,

2) Provide the systemd service and socket units to activate them, and

3) Convince any distribution that packages them them to enable the
   socket unit at package installation time.

I'm not sure how much #3 applies to authors.  Debian just enables
everything at package installation time, but Fedora requires the
sysadmin to enable things explicitly.  That said, I see that you treat
this in much greater depth in the -dev document, so this might be an
acceptable level of detail for users and sysadmins.

> +Each mountable filesystem type is backed by two systemd units, named after the
> +filesystem subtype (the part after "fuse." in the mount type). For a subtype
> +"myfs":
> +
> +  - myfs@.service   the sandboxed server (a template, one instance per
> +                    connection)
> +  - myfs.socket     the listening socket that activates it
> +
> +The socket listens on a SOCK_SEQPACKET UNIX socket at
> +
> +  <service-socket-dir>/<subtype>            e.g. /run/filesystems/myfs

NOTE: There's a hidden path length limitation here.  Because of the way
AF_UNIX sockets work, the maximum path length is UNIX_PATH_MAX (108)
bytes, not the usual PATH_MAX.  I don't think there's going to be many
filesystems with a subtype that long (91 bytes!) but if you think there
might, then we could shorten that to /run/fuse" or something.  I'm not
worried about it, but now would be the time to change that.

> +and is configured with "Accept=yes", so systemd spawns a fresh, isolated
> +server instance for every mount request.

Technically speaking you *could* set up Accept=no and provide a service
program that accepts the unix socket and starts a new server.  All
instances would then be trapped in the same container.  I don't claim
that makes any sense for this context, but it can be done.

(Perhaps this should be the last we discuss that topic ;))

> +Install the units into the systemd unit directory (usually
> +/run/systemd/system or /etc/systemd/system), then:
> +
> +    systemctl daemon-reload
> +    systemctl start myfs.socket
> +
> +The socket unit can be enabled to start at boot:
> +
> +    systemctl enable myfs.socket
> +
> +The example filesystems ship ready-to-adapt units; see
> +example/service_ll@.service and example/service_ll.socket(.in).

This is correct, regardless of who does it.

> +
> +Mounting
> +--------
> +
> +Mount the filesystem with the usual mount(8) syntax, using the type
> +"fuse.<subtype>":
> +
> +    mount -t fuse.myfs <source> <mountpoint> [-o options]
> +
> +For example:
> +
> +    mount -t fuse.service_ll /dev/sda /mnt
> +
> +A block-device-backed filesystem uses "fuseblk.<subtype>" instead.
> +
> +The same line works from /etc/fstab:
> +
> +    <source>  <mountpoint>  fuse.myfs  <options>  0 0
> +
> +The mount is handled by the mount.fuse3 helper, which notices that a service
> +socket exists for the type and hands the request to fuservicemount3. The
> +<source> and -o options are forwarded to the running server.

The mountpoint (or really, anything except the "-t fuse.XXX") are all
forwarded to the server for parsing.

(I'm glad you don't mention that old weird mount -t fuse.ext4#/dev/sda
syntax)

> +Checking whether a service is available
> +---------------------------------------
> +
> +To test whether a service socket exists for a given filesystem type without
> +mounting anything:
> +
> +    fuservicemount3 -t fuse.myfs --check
> +
> +It exits 0 if a service socket is present, non-zero otherwise. Note that this
> +only checks that the socket exists; it does not verify that a server actually
> +answers.

I think it's worth noting here that because we manage the socket with
systemd and put it in /run, that the presence of the socket always means
that the server is available.

But I guess if we're going to do that, then we need to make it clear
that the socket file needs RemoveOnStop=yes.

> +Unmounting
> +----------
> +
> +Unmount as you would any FUSE filesystem:
> +
> +    fusermount3 -u <mountpoint>
> +
> +or, as a privileged user:
> +
> +    umount <mountpoint>
> +
> +
> +Dispatch and fallback
> +---------------------
> +
> +When you run "mount -t fuse.myfs ...", the mount.fuse3 helper first checks for
> +a service socket for "myfs". The behaviour is:
> +
> +  - If a socket exists (and no options that are incompatible with service
> +    mounts were given), the mount is performed through fuservicemount3 and the
> +    running service.
> +
> +  - If no socket exists, mount.fuse3 transparently falls back to the

"If no socket exists or there were options that are incompatible with
service mounts, mount.fuse3 transparently falls back..."

> +    traditional path: it executes the filesystem's own mount command, exactly
> +    as it would without service mount support.

I thought the fallback was sh -c "myfs $source $mntpoint -o $options" ?

"...falls back to the traditional path: executing the filesystem server
directly, exactly as was done before."

> +So enabling service mount support does not break filesystems that are not set
> +up as services; they continue to mount the old way.
> +
> +A few options force the traditional path and skip the service even when a
> +socket is present, because they are meaningless to an already-running,
> +isolated server (for example passing a pre-opened FUSE fd, or the
> +mount.fuse3 "setuid=USER" option).

Ewwww :/

> +Security model
> +--------------
> +
> +  - The FUSE server runs under the confinement defined by its .service unit,
> +    not under the mount caller's identity or privileges.

"...identity, privileges, or namespaces."

> +  - The server has no access to the caller's filesystem. Anything it needs
> +    (the backing device or file, /dev/fuse) is opened by the privileged
> +    fuservicemount3 helper and passed to the server over the socket. The
> +    server can refuse to accept further passed file descriptors once it has
> +    what it needs.
> +
> +  - The only setuid-root component is fuservicemount3, which performs just the
> +    mount and the file-descriptor hand-off.
> +
> +This is the same trust boundary as fusermount3, but with the filesystem
> +implementation itself kept out of the privileged and caller-facing paths.

<nod>

> +Who establishes the connection
> +------------------------------
> +
> +Three parties touch the service socket, but only one dials it:
> +
> +  - systemd owns and listens on the socket. Starting the .socket unit creates
> +    the listening socket at <service-socket-dir>/<subtype>; no server is
> +    running yet.
> +
> +  - fuservicemount3 (the helper) is the client. When you mount, it connects to

I think we could remove a potential ambiguity by amending the sentence
to end with "...is the socket client." since the kernel is the fuse
server's client.

> +    that socket -- after dropping back to your real, unprivileged user id, so
> +    the kernel checks the socket's permissions against you, not against root.
> +    This is the access-control gate: only users the socket grants connect
> +    (write) permission to can mount.
> +
> +  - systemd accepts the connection and, because the .socket unit uses
> +    Accept=yes, starts a fresh per-connection server instance and hands it the
> +    already-connected socket. The server never connects or accepts; it
> +    inherits the live connection.
> +
> +So to control who may mount a given filesystem, set the ownership, group, or
> +ACL of its socket (or the service-socket-perms build default) accordingly.

For users and sysadmins, it's probably better to tell them to modify the
owner/group/acl of the socket file directly.

(I'm not sure how you set an ACL via systemd .socket file; the
mode/uid/gid all have Socket{Mode,User,Group} directives.)

> +
> +Troubleshooting
> +---------------
> +
> +  - "mounts the old way / service is ignored": confirm the socket exists with
> +    "fuservicemount3 -t fuse.<subtype> --check", that <service-socket-dir>
> +    matches how libfuse was built, and that the .socket unit is started.
> +
> +  - "fuservicemount3: not found" or permission errors: verify the helper is
> +    installed in sbindir and is setuid root.
> +
> +  - server-side errors: because the server logs to its own journal, inspect it
> +    with "journalctl -u myfs@*" (the example units log to the kernel ring
> +    buffer via /dev/ttyprintk, viewable with dmesg).

TIL, wildcards work with journalctl.

> +
> +See also
> +--------
> +
> +  README.service-mount-dev   writing a FUSE server that runs as a service
> +  fuservicemount3(8)
> +  mount.fuse3(8)
> +  fusermount3(1)
> +  mount(8)
> +  systemd.socket(5)
> diff --git a/doc/README.service-mount-dev b/doc/README.service-mount-dev
> new file mode 100644
> index 00000000000000..f584556a0045e9
> --- /dev/null
> +++ b/doc/README.service-mount-dev
> @@ -0,0 +1,432 @@
> +Writing a FUSE server that runs as a socket service
> +===================================================
> +
> +This document is for developers who want their FUSE server to be mountable as
> +a sandboxed systemd socket service, using the fuse_service_* API declared in
> +fuse_service.h. Administrators and users who only want to mount such a
> +filesystem should read README.service-mount instead.
> +
> +The complete working examples referenced throughout are:
> +
> +    example/service_ll.c     low-level API server
> +    example/service_hl.c     high-level API server
> +    example/single_file.c    backing-store helper shared by both
> +    example/service_ll@.service, example/service_ll.socket.in   systemd units
> +
> +
> +The execution model
> +--------------------
> +
> +A service-mount server does not mount anything itself and does not run in the
> +mounting user's context. Instead:
> +
> +  1. systemd listens on a per-subtype UNIX socket (Accept=yes) and starts one
> +     confined instance of your server per incoming mount request.
> +
> +  2. The privileged fuservicemount3 helper connects to that socket, opens
> +     /dev/fuse, and passes the device fd plus your command-line arguments to
> +     the server.
> +
> +  3. Your server cannot open files itself (its sandbox has no access to the
> +     caller's filesystem or to /dev), so it asks the helper to open any
> +     backing files or block devices on its behalf and pass the descriptors
> +     back.
> +
> +  4. Your server binds the FUSE session to the passed /dev/fuse fd and asks
> +     the helper to perform the mount(2). Requests start flowing immediately.
> +
> +Everything the server needs from the outside world therefore arrives over the
> +socket; the server never acquires mount permission and never touches the

"...the server never needs mount permission..." ?

> +caller's environment.
> +
> +
> +The mount protocol
> +------------------
> +
> +S and H denote the two parties:
> +
> +  S = the FUSE server   -- your binary, one <subtype>@.service instance
> +  H = fuservicemount3   -- the setuid-root mount helper; the socket client
> +
> +Transport:
> +
> +  - one AF_UNIX SOCK_SEQPACKET socket, created by systemd at
> +    <service-socket-dir>/<subtype> (e.g. /run/filesystems/myfs)
> +  - H connect()s as the real user (that uid gates who may mount); systemd
> +    accept()s (Accept=yes) and hands the connected fd to a fresh S, which
> +    adopts it in fuse_service_accept()
> +  - one message per datagram (sendmsg with MSG_EOR); a passed fd travels as
> +    SCM_RIGHTS ancillary data, exactly one fd per message
> +  - every multi-byte field is big-endian; no message exceeds

I would say "network byte order", not "big-endian".

> +    FUSE_SERVICE_MAX_CMD_SIZE (65536 bytes)
> +  - after "DOIT" the socket is idle: FUSE traffic uses /dev/fuse, not here

We probably should mention somewhere that the mount helper won't
disconnect until the fuse server sends BYEE (or closes the socket).
There's not much you can do with the mount helper after DOIT, but
there's no prohibition against the server holding on to the socket and
asking for more resources.

> +Every message begins with a 4-byte magic that spells the quoted tag in ASCII
> +(e.g. "OPEN" is 0x4f50454e), so a message is legible in a hex dump. Most tags
> +are operation mnemonics (OPEN, BDEV, TYPE, NAME, MNTP, DOIT, BYEE, ...); the
> +handshake pair is not: "SAFT" (the HELLO command) and "LAST" (its reply) are
> +fixed sentinels with no mnemonic meaning. Structures, verbatim from

SAFT/LAST are a reference to an old Harold Lloyd movie. ;)

> +fuse_service_priv.h:
> +
> +    struct fuse_service_packet { uint32_t magic; };
> +
> +    struct fuse_service_hello {              /* "SAFT" */
> +        struct fuse_service_packet p;
> +        uint16_t min_version, max_version;   /* both 1 */
> +        uint32_t flags;  /* ALLOW_OTHER 1<<0 | FUSEBLK 1<<1; what H allows */
> +    };
> +    struct fuse_service_hello_reply {        /* "LAST" */
> +        struct fuse_service_packet p;
> +        uint16_t version, padding;           /* version 1 */
> +    };
> +    struct fuse_service_simple_reply {       /* "REPL" */
> +        struct fuse_service_packet p;
> +        uint32_t error;  /* 0, else positive errno */
> +    };
> +    struct fuse_service_requested_file {     /* "FILE", carries one fd */
> +        struct fuse_service_packet p;
> +        uint32_t error;  /* 0, else positive errno and no fd */
> +        char path[];     /* echoes the request path; NUL-terminated */
> +    };
> +    struct fuse_service_open_command {       /* "OPEN" file / "BDEV" device */
> +        struct fuse_service_packet p;
> +        uint32_t open_flags;    /* O_* */
> +        uint32_t create_mode;
> +        uint32_t request_flags; /* QUIET 1<<0 */
> +        uint32_t block_size;    /* "BDEV" only */
> +        char path[];
> +    };
> +    struct fuse_service_fsopen_command {     /* "TYPE" */
> +        struct fuse_service_packet p;
> +        uint32_t fsopen_flags;  /* FUSEBLK 1<<0, set iff fstype is fuseblk */
> +    };
> +    struct fuse_service_string_command {     /* "NAME" / "OPTS" / "MTAB" */
> +        struct fuse_service_packet p;
> +        char value[];
> +    };
> +    struct fuse_service_mountpoint_command { /* "MNTP" */
> +        struct fuse_service_packet p;
> +        uint16_t expected_fmt, padding;  /* S_IFDIR / S_IFREG, or 0 */
> +        char value[];  /* the mountpoint */
> +    };
> +    struct fuse_service_mount_command {      /* "DOIT" */
> +        struct fuse_service_packet p;
> +        uint32_t ms_flags;  /* MS_* */
> +    };
> +    struct fuse_service_bye_command {        /* "BYEE" */
> +        struct fuse_service_packet p;
> +        uint32_t exitcode;
> +    };
> +
> +The "argv" descriptor is a memfd; its bytes are one header, then argc entries,
> +then the packed argument strings:
> +
> +    struct fuse_service_memfd_argv { uint32_t magic /* "ARGS" */, argc; };
> +    struct fuse_service_memfd_arg  { uint32_t pos, len; };  /* x argc */
> +
> +Message sequence.  "A -> B msg" = A sends msg to B.  A bracketed [call] names
> +the fuse_service_* function that drives the step; "local:" steps send nothing.
> +
> +  handshake  [fuse_service_accept]
> +    H -> S  "SAFT"  fuse_service_hello
> +    S -> H  "LAST"  fuse_service_hello_reply
> +
> +  fd handover, both pushed by H unsolicited  [fuse_service_accept]
> +    H -> S  "FILE"  fuse_service_requested_file +fd   path "argv"
> +    H -> S  "FILE"  fuse_service_requested_file +fd   path "fusedev"
> +    local:  S reads argv out of the memfd  [fuse_service_append_args]
> +
> +  backing store, repeated per file, may be none
> +    S -> H  "OPEN" / "BDEV"  fuse_service_open_command
> +            [fuse_service_request_file / fuse_service_request_blockdev]
> +    H -> S  "FILE"  fuse_service_requested_file +fd   (or error and no fd)
> +            [fuse_service_receive_file]
> +    local:  setsockopt(SO_PASSRIGHTS, 0)  [fuse_service_finish_file_requests]
> +
> +  mount  [fuse_service_session_mount].  S sends each command below; H answers
> +         every one with  H -> S  "REPL"  fuse_service_simple_reply, whose
> +         nonzero errno aborts the mount.
> +    local:  bind se to /dev/fd/<fusedev>  (fuse_session_mount)
> +    S -> H  "TYPE"  fuse_service_fsopen_command
> +    S -> H  "NAME"  fuse_service_string_command        (mtab source)
> +    S -> H  "MNTP"  fuse_service_mountpoint_command
> +    S -> H  "OPTS"  fuse_service_string_command        (optional)
> +    S -> H  "MTAB"  fuse_service_string_command        (optional)
> +    S -> H  "DOIT"  fuse_service_mount_command         (H runs mount(2) here)
> +
> +  shutdown  [fuse_service_send_goodbye]
> +    S -> H  "BYEE"  fuse_service_bye_command   no reply; S closes socket

This matches my recollection of the protocol's data packets.

> +
> +The two entry points
> +--------------------
> +
> +There are two ways to write the server, mirroring the normal libfuse APIs:
> +
> +  - High-level API: do the service setup, then call fuse_service_main(), the
> +    service-aware counterpart of fuse_main(). See example/service_hl.c.
> +
> +  - Low-level API: do the service setup, create the session yourself, call
> +    fuse_service_session_mount(), and run your own event loop. See
> +    example/service_ll.c.
> +
> +Both share the same startup, resource-request, and shutdown sequence.
> +
> +IMPORTANT: define FUSE_USE_VERSION to at least FUSE_MAKE_VERSION(3, 19) and
> +include <fuse_service.h>. Do NOT call fuse_daemonize(): a service must stay in
> +the foreground so systemd can track it (fuse_service_session_mount and
> +fuse_service_main arrange this for you).

Hrm.  How does this work with SYNC_INIT?  I think a fuse service daemon
could still call fuse_daemonize_early_start(NO_CHDIR | NO_BACKGROUND),
right?  Would that be worth mentioning here?

> +
> +API reference
> +-------------
> +
> +The full per-call documentation lives in fuse_service.h (and fuse.h for the
> +high-level fuse_service_main). Unless noted, each int-returning call returns 0
> +on success or a negative errno. In call order:
> +
> +    /* startup */
> +    int  fuse_service_accept(struct fuse_service **sfp);
> +    bool fuse_service_accepted(const struct fuse_service *sf);
> +    int  fuse_service_append_args(struct fuse_service *sf,
> +         struct fuse_args *args);

Style nit: It'd be easier on my old eyes if the second line wasn't
indented to start in the same column as the name above it, e.g.

    int  fuse_service_append_args(struct fuse_service *sf,
             struct fuse_args *args);
    int  fuse_service_parse_cmdline_opts(struct fuse_args *args,
             struct fuse_cmdline_opts *opts);        /* returns 0 / -1 */

> +    int  fuse_service_parse_cmdline_opts(struct fuse_args *args,
> +         struct fuse_cmdline_opts *opts);            /* returns 0 / -1 */
> +
> +    /* capability negotiation */
> +    bool fuse_service_can_allow_other(const struct fuse_service *sf);
> +    bool fuse_service_can_fuseblk(const struct fuse_service *sf);
> +
> +    /* backing files: request, receive each fd, then stop fd passing */
> +    int  fuse_service_request_file(const struct fuse_service *sf,
> +         const char *path, int open_flags, mode_t create_mode,
> +         unsigned int request_flags);
> +    int  fuse_service_request_blockdev(const struct fuse_service *sf,
> +         const char *path, int open_flags, mode_t create_mode,
> +         unsigned int request_flags, unsigned int block_size);
> +    int  fuse_service_receive_file(const struct fuse_service *sf,
> +         const char *path, int *fdp);
> +    int  fuse_service_finish_file_requests(const struct fuse_service *sf);
> +
> +    /* mount */
> +    void fuse_service_expect_mount_format(struct fuse_service *sf,
> +         mode_t expected_fmt);
> +    int  fuse_service_session_mount(struct fuse_service *sf,
> +         struct fuse_session *se, mode_t expected_fmt,
> +         struct fuse_cmdline_opts *opts);
> +    int  fuse_service_main(struct fuse_service *sf, struct fuse_args *args,
> +         const struct fuse_operations *op, void *user_data);
> +
> +    /* shutdown */
> +    int  fuse_service_send_goodbye(struct fuse_service *sf, int exitcode);
> +    void fuse_service_release(struct fuse_service *sf);
> +    void fuse_service_destroy(struct fuse_service **sfp);
> +    int  fuse_service_exit(int ret);
> +
> +    #define FUSE_SERVICE_REQUEST_FILE_QUIET (1U << 0)
> +
> +fuse_service_receive_file sets *fdp to a valid fd (>= 0) or a negated errno
> +from the helper's open attempt; the call itself returns nonzero only on a
> +socket-level failure. fuse_service_accept always initialises *sfp; test
> +fuse_service_accepted (true iff *sfp != NULL) to learn whether the program was
> +actually launched as a service.

Sounds good!

> +Startup sequence
> +----------------
> +
> +The first thing main() does is accept the service context:
> +
> +    struct fuse_service *service;
> +
> +    if (fuse_service_accept(&service))
> +        goto error;                 /* socket/handshake failure */
> +
> +    if (!fuse_service_accepted(service))
> +        goto error;                 /* not started as a service */

I think most fuse servers install themselves in PATH, right?  For those
servers, in the !accepted case, the server should proceed with a normal
mount (e.g. fuse_session_new -> fuse_session_mount -> event loop), not
error out.

But I guess it's up to the author.

> +fuse_service_accept() looks for the socket handed to the process by systemd,
> +performs the protocol handshake, and receives the argument vector and the
> +/dev/fuse fd. It always initialises *service; use fuse_service_accepted() to
> +find out whether the program is actually running as a service (it returns
> +false, with *service == NULL, when there is no service socket). A real server
> +can use this to support both service and traditional invocation from one
> +binary.
> +
> +Next, fold the service-supplied arguments into your fuse_args and parse them:
> +
> +    struct fuse_args args = FUSE_ARGS_INIT(argc, argv);

I think it would reduce confusion here to say explicitly that argc and
argv are the ones passed to main().

> +
> +    if (fuse_service_append_args(service, &args))   /* add helper's args */
> +        goto error;
> +
> +    if (fuse_opt_parse(&args, &priv, my_opts, my_opt_proc))   /* your opts */
> +        goto error;
> +
> +For the low-level API also extract the common command-line options:
> +
> +    struct fuse_cmdline_opts opts = { };
> +
> +    if (fuse_service_parse_cmdline_opts(&args, &opts))
> +        goto error;
> +
> +fuse_service_parse_cmdline_opts() is the service-mount analogue of
> +fuse_parse_cmdline(). It does NOT validate the mountpoint; that is the
> +helper's job. As usual, a missing -o subtype=/fsname= defaults the subtype to
> +the program's basename.

<nod> Looks good otherwise!

> +Requesting backing files and block devices
> +-------------------------------------------
> +
> +Because the sandbox cannot open files, the server asks the helper to open them
> +and send back the descriptor. This is a two-step request/receive pattern (see
> +single_file_service_open() in example/single_file.c):
> +
> +    /* ask the helper to open it */
> +    fuse_service_request_file(service, path, open_flags, create_mode, flags);
> +    /* or, for a block device: */
> +    fuse_service_request_blockdev(service, path, open_flags, create_mode,
> +                                  flags, block_size);

Should this mention that block_size can be 0 if the caller doesn't care?

> +
> +    /* then collect the descriptor */
> +    int fd;
> +    fuse_service_receive_file(service, path, &fd);
> +
> +On success fd is a valid descriptor. A negative fd is a (negated) errno from
> +the helper's open attempt — single_file.c uses this to downgrade an O_RDWR
> +request to O_RDONLY when the backing store is read-only. Pass
> +FUSE_SERVICE_REQUEST_FILE_QUIET in the request flags to suppress the helper's
> +error message when a failure is expected.
> +
> +Once you have every descriptor you need, close the door on further fd passing:
> +
> +    fuse_service_finish_file_requests(service);
> +
> +This tells the kernel to reject any additional descriptors on the socket
> +(via SO_PASSRIGHTS where available), so a compromised or malicious helper
> +cannot smuggle in more fds afterwards.
> +
> +
> +Capability negotiation
> +----------------------
> +
> +During the handshake the helper advertises what it is willing to do. Query it
> +before relying on those behaviours:
> +
> +    fuse_service_can_allow_other(service)   /* may honour -o allow_other */
> +    fuse_service_can_fuseblk(service)       /* may mount a fuseblk filesystem */

<nod>

> +Mounting
> +--------
> +
> +Tell the service the file type expected at the mountpoint (S_IFDIR for a
> +directory, S_IFREG for a regular file, or 0 to skip the check):
> +
> +    fuse_service_expect_mount_format(service, S_IFDIR);

Note that the default is 0, so servers don't have to call
fuse_service_expect_mount_format for that.

> +
> +High-level API — hand off to fuse_service_main(), which builds the operations,
> +performs the mount, and runs the loop:
> +
> +    ret = fuse_service_main(service, &args, &my_oper, NULL);
> +
> +Low-level API — create the session, install signal handlers, then mount:
> +
> +    se = fuse_session_new(&args, &my_ll_oper, sizeof(my_ll_oper), NULL);
> +    ...
> +    fuse_set_signal_handlers(se);
> +
> +    if (fuse_service_session_mount(service, se, S_IFDIR, &opts))
> +        goto error;
> +
> +    fuse_session_loop(se);          /* or fuse_session_loop_mt(se, config) */
> +
> +fuse_service_session_mount() binds the session to the passed /dev/fuse fd and
> +asks the helper to mount(2) the filesystem. It forces foreground operation and
> +chdir("/") so you do not need (and must not) call fuse_daemonize(). After it
> +returns successfully the kernel is already routing requests to your server, so
> +enter your event loop promptly.

This otherwise looks good to me.

> +
> +Shutdown
> +--------
> +
> +Tell the helper you are leaving, releasing and destroying the service context:
> +
> +    fuse_service_send_goodbye(service, exitcode);   /* report exit status */
> +    fuse_service_release(service);                  /* free socket-side state */
> +    ...
> +    fuse_service_destroy(&service);                 /* free the context */
> +
> +    return fuse_service_exit(ret);                  /* map ret to an exit code */
> +
> +In the examples, send_goodbye is sent once mounting has succeeded and the loop
> +is about to start, and again on the error paths; fuse_service_exit() at the end
> +of main() converts the server's return value into the exit status systemd
> +expects. fuse_service_destroy() takes a pointer to the pointer and clears it.
> +
> +fuse_service_accepted() lets a single binary detect whether it was launched as
> +a service. The example servers require it and exit otherwise (their error
> +paths run only once the context is valid). A server that also wants to support
> +traditional invocation can branch on it and fall back to fuse_main() /
> +fuse_session_mount(); in that case do not call the other fuse_service_*
> +functions, which assume a valid service context.

Should this go in the section about fuse_service_accepted() above?

> +The systemd units
> +-----------------
> +
> +Ship two units per filesystem, named after the subtype (the part after
> +"fuse." in the mount type). For subtype "myfs":
> +
> +  myfs.socket    — the listening socket. It must use SOCK_SEQPACKET, accept
> +                   each connection, and listen at the configured service
> +                   socket directory under the subtype name. The example
> +                   socket file is processed by meson, which substitutes the
> +                   build-time values:
> +
> +                       [Socket]
> +                       ListenSequentialPacket=@FUSE_SERVICE_SOCKET_DIR_RAW@/myfs
> +                       Accept=yes
> +                       SocketMode=@FUSE_SERVICE_SOCKET_PERMS@
> +                       RemoveOnStop=yes
> +
> +                       [Install]
> +                       WantedBy=sockets.target
> +
> +  myfs@.service  — the server template, one instance per connection. Set
> +                   ExecStart to your binary and lock the unit down as tightly
> +                   as the filesystem allows. example/service_ll@.service is a
> +                   good starting point: DynamicUser, no capabilities, private
> +                   mount/network/pid namespaces, a @system-service syscall
> +                   filter, and OOMPolicy=continue so the filesystem is not
> +                   torn down under memory pressure.
> +
> +The socket name must match the subtype your server reports (via the program
> +basename or -o subtype=), because that is the name fuservicemount3 looks for
> +under the service socket directory.

Looks good!

> +Building and installing
> +-----------------------
> +
> +Build a server the usual way, linking against fuse3 and including the new
> +header:
> +
> +    gcc -Wall single_file.c service_ll.c \
> +        `pkg-config fuse3 --cflags --libs` -o service_ll
> +
> +Install the binary, point ExecStart at it, install the .service and .socket
> +units into the systemd unit directory, then "systemctl daemon-reload" and
> +"systemctl start myfs.socket". From there the filesystem is mounted exactly as
> +described in README.service-mount.
> +
> +
> +See also
> +--------
> +
> +  fuse_service.h             the full fuse_service_* API reference (Doxygen)
> +  README.service-mount       installing and mounting a service filesystem
> +  example/service_ll.c, example/service_hl.c, example/single_file.c
> +  systemd.service(5), systemd.socket(5), systemd.exec(5)

Looks good, thanks for putting together the documentation!

> diff --git a/doc/fuservicemount3.8 b/doc/fuservicemount3.8
> index aa2167cb4872c6..ce028a1cae3fd5 100644
> --- a/doc/fuservicemount3.8
> +++ b/doc/fuservicemount3.8
> @@ -16,17 +16,155 @@ .SH SYNOPSIS
>  
>  .SH DESCRIPTION
>  Mount a filesystem using a FUSE server that runs as a socket service.
> -These servers can be contained using the platform's service management
> -framework.
> -
> -The second form checks if there is a FUSE service available for the given
> -filesystem type.
> +Unlike a traditional FUSE filesystem, which runs in the mount caller's
> +context, such a server runs as an independent, sandboxed systemd service.
> +\fBfuservicemount3\fP connects to the per-type service socket, hands the
> +running server the \fI/dev/fuse\fP device and any backing files it needs,
> +and performs the mount on its behalf. These servers can therefore be
> +contained using the platform's service management framework.
> +.PP
> +\fBfuservicemount3\fP is installed setuid root so that unprivileged users
> +can mount filesystems handled by a service. It is normally invoked
> +indirectly by \fBmount.fuse3\fP(8), not run directly.
> +.PP
> +The second form checks whether a FUSE service is available for the given
> +filesystem type, without mounting anything.
> +.SH FILESYSTEM REQUIREMENTS
> +This is not a transparent wrapper for arbitrary FUSE programs. Only a
> +filesystem whose server is written to the libfuse service API can be mounted
> +this way. A conventional server that calls \fBfuse_main\fP(3) opens

nit: comma before "opens" at the end of the line.

> +\fI/dev/fuse\fP and performs the mount itself, which the service sandbox does
> +not permit, so it cannot be used unmodified.
> +.PP
> +A service-capable server instead:
> +.IP \- 2
> +accepts the listening socket that systemd hands it, and receives its
> +arguments and the \fI/dev/fuse\fP descriptor over that socket, rather than
> +opening the device itself;
> +.IP \- 2
> +asks the helper to open any backing files or block devices on its behalf,
> +because its sandbox has no direct filesystem access; and
> +.IP \- 2
> +lets the helper perform the mount, staying in the foreground under systemd.
> +.PP
> +The server binary, its \fB@.service\fP unit, and its \fB.socket\fP unit must
> +all be installed before the type can be mounted. See \fBEXAMPLES\fP below, the
> +\fIservice_ll.c\fP and \fIservice_hl.c\fP example servers, the
> +\fI<fuse_service.h>\fP header, and the \fIREADME.service-mount-dev\fP document
> +for how to build one.
> +.SH OPTIONS
> +.TP
> +.B source
> +The filesystem source, passed on to the running server (for example a
> +backing device or file). May be empty.
> +.TP
> +.B mountpoint
> +Where to mount the filesystem.
> +.TP
> +.BI -t " fstype"
> +The filesystem type, of the form \fBfuse.\fIsubtype\fR or
> +\fBfuseblk.\fIsubtype\fR. The \fIsubtype\fR selects the service socket.
> +.TP
> +.BI -o " options"
> +Mount options to forward to the server.
> +.TP
> +.B --check
> +Only test whether a service socket exists for the type given with \fB-t\fP;
> +do not mount. Exit status is zero if a socket is present, non-zero
> +otherwise. This does not verify that a server actually answers.
> +.SH FILES
> +.TP
> +.I /run/filesystems/<subtype>

Nit you could ignore: should the build system set this from whatever
-Dservice-socket-perms option might have been specified?  I think few
distros will do this, and most that do can just patch the docs.

> +The default location of the per-filesystem service socket. The directory is
> +configurable at build time (meson option \fBservice-socket-dir\fP).
> +.SH EXAMPLES
> +A complete walk-through using the \fIservice_ll\fP example filesystem that
> +ships with libfuse.
> +.SS "What it is for"
> +\fIservice_ll\fP exports a single file or block device as a one-file
> +filesystem. Running it as a service keeps the server inside a systemd sandbox
> +\(em its own unprivileged user, private namespaces, and no capabilities \(em
> +while still letting a permitted user mount it with an ordinary \fBmount\fP
> +command. The privileged work (opening the backing device and calling
> +\fBmount\fP(2)) is done only by the setuid \fBfuservicemount3\fP helper. The
> +same recipe applies to any server written with the libfuse service API.
> +.SS "Setting up the service (administrator, once)"
> +The source for this example ships with the libfuse distribution in its
> +\fIexample\fP directory: \fIservice_ll.c\fP together with its helper
> +\fIsingle_file.c\fP make up the server, and \fIservice_ll@.service\fP and
> +\fIservice_ll.socket\fP are its systemd units. From that directory, build the
> +server and install the binary on the root filesystem:
> +.PP
> +.RS
> +.nf
> +gcc -Wall single_file.c service_ll.c $(pkg-config fuse3 --cflags --libs) -o service_ll
> +sudo install -m 0755 service_ll /usr/local/sbin/service_ll
> +.fi
> +.RE
> +.PP
> +libfuse provides two systemd units for this example: \fIservice_ll@.service\fP
> +(the sandboxed server) and \fIservice_ll.socket\fP (the activation socket,
> +already configured to listen at \fI/run/filesystems/service_ll\fP). Edit the
> +service unit's \fBExecStart\fP to point at the installed binary:
> +.PP
> +.RS
> +.nf
> +ExecStart=/usr/local/sbin/service_ll
> +.fi
> +.RE
> +.PP
> +Install both units, reload systemd, and start the socket:
> +.PP
> +.RS
> +.nf
> +sudo cp service_ll@.service service_ll.socket /run/systemd/system/
> +sudo systemctl daemon-reload
> +sudo systemctl start service_ll.socket
> +.fi
> +.RE
> +.PP
> +Only the socket is running now; systemd starts a fresh, isolated server
> +instance on demand for each mount.
> +.SS "Mounting and using it"
> +Confirm a service is available for the type (this prints nothing; the exit
> +status is the answer):
> +.PP
> +.RS
> +.nf
> +fuservicemount3 -t fuse.service_ll --check && echo available
> +.fi
> +.RE
> +.PP
> +Mount it, passing the backing device or file as the source. Run this as root
> +or from an \fI/etc/fstab\fP entry that permits the mount:
> +.PP
> +.RS
> +.nf
> +mount -t fuse.service_ll /dev/sda /mnt
> +.fi
> +.RE
> +.PP
> +\fBmount.fuse3\fP(8) notices the service, \fBfuservicemount3\fP opens
> +\fI/dev/sda\fP and performs the mount, and the data appears under \fI/mnt\fP.
> +Unmount it like any other FUSE filesystem:
> +.PP
> +.RS
> +.nf
> +fusermount3 -u /mnt
> +.fi
> +.RE
> +.PP
> +For the full hardened unit files and further detail, see the
> +\fIservice_ll@.service\fP and \fIservice_ll.socket\fP files shipped with
> +libfuse and the \fIREADME.service-mount\fP document.
>  .SH "AUTHORS"
>  .LP
>  The author of the fuse socket service code is Darrick J. Wong <djwong@kernel.org>.
>  Debian GNU/Linux distribution.
>  .SH SEE ALSO
> +.BR mount.fuse3 (8)
>  .BR fusermount3 (1)
>  .BR fusermount (1)
>  .BR mount (8)
>  .BR fuse (4)
> +.BR systemd.socket (5)

Looks good, thanks for writing this.

> diff --git a/doc/mainpage.dox b/doc/mainpage.dox
> index 36ba3bcba268a8..9de96e1410abe2 100644
> --- a/doc/mainpage.dox
> +++ b/doc/mainpage.dox
> @@ -28,6 +28,19 @@ separate set of API functions.
>  The high-level API that is primarily specified in fuse.h. The
>  low-level API that is primarily documented in fuse_lowlevel.h.
>  
> +## Running a filesystem as a systemd service ##
> +
> +A FUSE server can also be run as a sandboxed, socket-activated systemd
> +service rather than as a child of the mounting process. In this model the
> +server runs under its own unprivileged identity and in private namespaces,
> +while a small setuid helper (fuservicemount3) performs the mount on its
> +behalf. Servers use the service API in fuse_service.h; the service_hl.c and
> +service_ll.c examples show the high- and low-level variants.
> +
> +The README.service-mount and README.service-mount-dev files in the source
> +*doc* directory document this feature for administrators and filesystem
> +authors respectively.
> +
>  ## Examples ##
>  
>  FUSE comes with several examples in the <a
> diff --git a/doc/mount.fuse3.8 b/doc/mount.fuse3.8
> index 2e587458a06e63..43130e9e109c4a 100644
> --- a/doc/mount.fuse3.8
> +++ b/doc/mount.fuse3.8
> @@ -224,6 +224,23 @@ .SS "\fBmount.fuse3\fP options:"
>  \fBdrop_privileges\fP
>  Perform setup of the FUSE file descriptor and mounting the file system before launching the FUSE file system process. \fBmount.fuse3\fP requires privilege to do so, i.e. must be run as root or at least with \fBCAP_SYS_ADMIN\fP and \fBCAP_SETPCAP\fP. It will launch the file system process fully unprivileged, i.e. without \fBcapabilities\fP(7) and \fBprctl\fP(2) flags set up such that privileges can't be reacquired (e.g. via setuid or fscaps binaries). This reduces risk in the event of the FUSE file system process getting compromised by malicious file system data. Because the file system program is launched after privileges have been dropped, it and the libraries it links against must reside at a path the unprivileged process can resolve: every directory component must be searchable without elevated privileges.
>  
> +.SH SERVICE MOUNTS
> +If libfuse was built with service mount support, \fBmount.fuse3\fP can mount
> +filesystems whose server runs as a sandboxed systemd socket service instead of
> +as a child of the mounting process. When you mount a type \fBfuse.\fIsubtype\fR
> +(or \fBfuseblk.\fIsubtype\fR), \fBmount.fuse3\fP first checks for a service
> +socket for that subtype. If one exists, the mount is handed to
> +\fBfuservicemount3\fP(8) and performed by the already-running, isolated server;
> +the \fIsource\fP and \fB-o\fP options are forwarded to it.
> +.PP
> +If no service socket exists, \fBmount.fuse3\fP transparently falls back to the
> +traditional behaviour and launches the filesystem's own mount command, so
> +filesystems that are not set up as services are unaffected. Some options that
> +are incompatible with an already-running server (such as passing a pre-opened
> +FUSE file descriptor, or \fBsetuid=USER\fP) also force the traditional path.
> +.PP
> +See the libfuse \fIREADME.service-mount\fP document for details on installing
> +and using service-mounted filesystems.
>  .SH FUSE MODULES (STACKING)
>  Modules are filesystem stacking support to high level API. Filesystem modules can be built into libfuse or loaded from shared object
>  .SS "iconv"
> @@ -269,5 +286,6 @@ .SH "AUTHORS"
>  .SH SEE ALSO
>  .BR fusermount3 (1)
>  .BR fusermount (1)
> +.BR fuservicemount3 (8)
>  .BR mount (8)
>  .BR fuse (4)

This also looks good to me!  Thanks for doing this, Bernd!

--D
