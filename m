Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091124CA287
	for <fuse-devel@lists.linux.dev>; Tue,  8 Sep 2026 22:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788907102; cv=none; b=nNpzHBQTgyJEpbz7TLoGu+Na+DAvP7lSiPSTOuNIJ0uTZmsGsWmMHGEUusRWI57ZFyTztw3gQmaDb3wFJLF8GLcF+3FBAmq9UDDxY9Kwl5C1tLg42BmoLK7xV3r1AMvuZbUCGzMjO55Hjl/zQ71iv1seG2NK1OyZGA/GzJlkDCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788907102; c=relaxed/simple;
	bh=aaWerwP3vvBPdSaDKhPoyzh4o7ShZOBBuWwC/ctK678=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=SyknNKTBaCyE9Yr09x7C//JBxlXi1azyEE9qNF91515yHcmFmHIfKhaX0/5r01/P4bAvnKqFYdYzqv8JEPFg4yQNqTPKW50TlXqGflflzFKpuPetBaUm+OUf1CtNkE7fn1Gco7//KL5ZhmXRpz7785usdRv1qzjyckIBwMIfZTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=cqFSfrlg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mrr5DOx/; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="cqFSfrlg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mrr5DOx/"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id B178B1D000C0
	for <fuse-devel@lists.linux.dev>; Tue,  8 Sep 2026 18:38:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 08 Sep 2026 18:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1788907096; x=1788993496; bh=Jvs8IeDkNE
	I6YXx26iS9Tz+TJyjoxpMxCAD7qKq42K8=; b=cqFSfrlgoXlnKyk2JvF4HazuiG
	IabtflLcb66r+7zeU/LO8ywukmui6MiYFu+693SKPUeAKc2/uKQB/Fffnhxc7fcy
	IZNCwghnyno3h4MrsaDZdW9k6YX+PiXdyBjT3vpq3X65uafpEhnO0JISr9CGKxcz
	Ry9ZpV0Y7+RuNJzKkU9rnEVMRKSLeCjSRBP4HTLQbW1TWxavE3+6L6VjBAsQPFx2
	a9DM2Ae2iQqxGkP7KvONSNzOjOEtszPKNwpDFRA8PoJZ11+Debi+ah6x9T+D+AaJ
	5hFWMlrK0J6U3AmOJt8tCQmT3EuMaDkdGGiB/KXr4YsD8/oDsp+rPOZP1x1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788907096; x=1788993496; bh=Jvs8IeDkNEI6YXx26iS9Tz+TJyjoxpMxCAD
	7qKq42K8=; b=mrr5DOx/VELkWUUNxrMR28rX6YMXg1yMC4dl4/ciKqH1azxhiQS
	hCDhOrD12uGacRUjRB1PrmVOYK8ypiy6h7OkoHbD1p4KqmiZAbmBUC34u+Al1nLN
	WAve+VuGE/22in08qOiyjQyqep8lGpgbSP2II8qhEaCgFhrSlgsLX+RFfUrq9081
	tQJ7J8QvcjIsfD/zPXvwcB9w8exKTlsl2jHHL4wusyPjCmlbdqD4Tw4sDmDZgUTI
	eDq8lUGgSPVVp56ijAJO5Wt+HO4TYrQ0KVg8Ve7kLrJ9ZXeO0yS8LAzUUmokkiUN
	jDpztnRuQE5NmQ780yydm/XjmSO7cSCESFg==
X-ME-Sender: <xms:WI6galTc71ZywqY8X_ALiICmnt2JXihtOv6t-_YwORjcBSc6qZVYiw>
    <xme:WI6galtcJCCwp7lUsR07Eg1GvU7xSIAop71x42gVvCYinV9lIsJgi78cuYAgZK8Ns
    qb-u5MgRohLY6Vkuy9VIgMl1wXrAvx4sIjw5B5qW4kWvEwIJKGI>
X-ME-Received: <xmr:WI6gageAe-R24PSn99UVMm9N_c2KC482o2nK_rSammRJ6A4_gxBkkI7BfhkW5i2loxGtQEc06jJyIB2LQQWzJEWFTPFEfhOloVep5uTxsku2AewlLw>
X-ME-Proxy-Cause: dmFkZTGzyLuJZXQwcqU4vKHawTTtRiDzLRlKZIBkfLzUyZVua6MiT/TBW3yT8JY9zq8UY5
    E8O/Y+OzmdjehrQDeCnRZKahC6V+1N0BifaD7PdoQppwp+x4QbL3UZ1Ssw2KTNEcvlYNYK
    0OBOxm7btAc+FpZL09NjPJ2vywBMwfCLzd+K2WvncZAUq6ZP4rxXPLiPdDW8c6pTsz3JWk
    EaAjOEtvlB9HhjG0sCmjEWq6B8gVzbw7+0F9hwAHHrynF+NJ3opD/FbQI2SIGS5ane8tcx
    Ej8qEX4f9KRN5VyTAJE0oHVU3jW4Wbs5PxXhRicS620zJdNIa8hoGjRVANNY988+ddywhi
    8cRCxyVdhHWD81w/BpQ2H/611sAfgHl+qXLks8o2yvuz/ObFT9hNFrTerrJQlBqIisI70N
    qwU+fzYtNsU7YPlnsBTonwfkUtObMi2R42b45+oukZc2TiIgD2BqjG8jjwTK7OGljLsdh7
    WixyoTHe03RnqDC9CJWpnHCcy6a5h8hpUEZf/KDlXMyfkgyqawzU8pArWc8mDS92Ug9RZ8
    t7xKTtbA0bzPvUMWXOWluKg0B1nEEiICAB2qj9kcyVnqXxHbSdPYDeUxc/CmLosX6iM934
    mYYpk6ECqIL2cyIEXX5xE7GiVNaeuR+3gmQK8z8xkwMGLllTD85qoxRe/Eiw
X-ME-Proxy: <xmx:WI6gaiJOhb5D84OIEHcXeCxh31zCoFtKwH7TlncUF2qt5_NaYUAs7A>
    <xmx:WI6gaubFcQc3H-svy6hnNAPHfMAr5rIfDrO_xLGj98XWnMhXxyH_vg>
    <xmx:WI6gatvT8Ah14pCmebfheW-jR-DxuTIImPfujpFx730SgQn1EzAmXg>
    <xmx:WI6garv_w3Py2m9WCXL65utH97gdnN3syDnVdqdQDcnojTzdgCuDCg>
    <xmx:WI6gahRq0fOfZHfFju540YIM7wdOXT89NA8952fW82k2a3VYj6sQCk_h>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <fuse-devel@lists.linux.dev>; Tue, 8 Sep 2026 18:38:16 -0400 (EDT)
Message-ID: <8ab2e1b3-548d-4b80-b99f-849ba3f639e7@bsbernd.com>
Date: Wed, 9 Sep 2026 00:38:14 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: fuse-devel@lists.linux.dev
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
Subject: [ANNOUNCE] libfuse 3.18.3 has been released
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear all,

I am pleased to announce the release of libfuse 3.18.3.

The source code is available for download at
https://github.com/libfuse/libfuse/releases.

Please report any issues on this mailing list or the GitHub issue
tracker at https://github.com/libfuse/libfuse/issues.

From ChangeLog.rst:

Security Fixes
--------------

* ``fuse_session_custom_io()`` is disabled unless libfuse is built with
  ``-Denable-custom-io=true``, and returns ``-ENOTSUP`` otherwise. The
  ``hello_ll_uds`` example is built only with that option, and enabling it
  warns at configure time.
  Reason is a custom io peer might not be a kernel and can
  forge requests that libfuse parses without bounds checks, crashing or
  corrupting the filesystem process. See ``doc/README.custom-io``.

* fusermount3: resolve the mountpoint once, through an ``O_PATH|O_NOFOLLOW``
  descriptor. A symlink swapped in between the type check and the second
  lookup could redirect the mount.
* fusermount3: run the auto-unmount probe as the calling user. It opened the
  caller-supplied mountpoint with elevated privileges before, so a symlink
  could get an attacker-chosen path opened as root.
* mount_util: terminate the ``/bin/mount`` and ``/bin/umount`` argument
  vectors with ``--``. ``fsname`` reaches them straight from ``-ofsname=`` in
  setuid-root fusermount3, and the child raises the real uid to 0 before
  ``execle()``, so an unprivileged caller controlled a positional operand of a
  mount(8) that was not in restricted mode.
* mount_util: skip the mtab update entirely for option-like mount arguments.
  BusyBox mount(8) does not honour ``--``.
* fusermount3: unmount through ``unmount_fuse()`` when passing the device
  descriptor to the caller fails, so that path drops privileges and runs the
  ``fusermount3 -u`` checks instead of calling ``umount2()`` as root on a
  caller-supplied path.
* fusermount3 and lib: pass ``UMOUNT_NOFOLLOW`` on the kernel and non-setuid
  unmount paths.
* fusermount3: check the ``fstat()`` return value when validating the
  communication file descriptor.
* fusermount3: fix an out-of-bounds read at index -1 in ``get_mnt_opts()``
  when the option string is empty, which a read-only mount with no further
  options reaches.
* util: avoid a pointer underflow when trimming ``fuse.conf`` lines.
* fusermount3: reject a negative ``mount_max`` other than the documented -1.
  A typo such as -2 made the limit comparison always true and blocked every
  non-root mount.
* lib: relay the KILLPRIV_V2 kill-suidgid flags to the filesystem in the new
  ``fuse_file_info::kill_suidgid``. Only ``setattr`` saw them before, so a
  filesystem that had taken over clearing suid/sgid never learned of it on
  ``O_TRUNC`` open and on write, and the bits survived.

Note: ``fuse_file_info::kill_suidgid`` is new in 3.18.3 and ``FUSE_VERSION``
carries no patch level. A filesystem built against these headers but running
against an older 3.18 library finds the field permanently zero, so require
3.18.3 at run time as well.

Important Fixes
---------------

* Fixed a hang on ``statx`` in builds without ``HAVE_STATX``: ``_do_statx()``
  never replied, so the kernel waited forever.
* io-uring: the CQE dispatch validated the opcode against ``fuse_ll_ops[]``
  but called through ``fuse_ll_ops2[]``, so an opcode with no handler there
  was called as a null function pointer.
* io-uring: fixed the notify-retrieve reply buffer handling. The
  ``fuse_notify_retrieve_in`` header sits at the start of the payload buffer,
  not in the ring header.
* io-uring: fixed the ``req_header_sz`` calculation, which sized the header
  buffer from the wrong struct.
* io-uring: create the rings with ``IORING_SETUP_SUBMIT_ALL``, so one failing
  commit SQE no longer leaves the rest of the batch unsubmitted.
* io-uring: ``fuse_reply_none()`` commits the ring entry. A FORGET answered
  that way leaked the entry and left the kernel-side request outstanding.
* fusermount3: treat ``ECONNABORTED`` like ``ENOTCONN`` when deciding whether
  to auto-unmount, so a daemon that dies with io-uring registered no longer
  leaves the mount behind.
* ``receive_fd()``: check ``CMSG_FIRSTHDR()`` for NULL before dereferencing it.
* ``fuse_session_loop_mt_312()`` no longer destroys ``se->mt_lock`` before
  ``fuse_session_destroy()`` destroys it again, which was undefined behaviour
  on every multi-threaded shutdown.
* ``fuse_loop_cfg_create()`` returning NULL is checked before the config is
  dereferenced in ``fuse_session_loop_mt_312()`` and
  ``fuse_session_loop_mt_31()``.
* iconv: the error check after opening the ``fromfs`` descriptor tested
  ``tofs``, so a failed ``iconv_open()`` was ignored and left an invalid
  descriptor behind.
* mount.fuse: a failure to clear ``FD_CLOEXEC`` went undetected, because the
  result was compared against 1 rather than -1.
* ``grow_pipe_to_max()`` opens ``/proc/sys/fs/pipe-max-size`` with
  ``O_CLOEXEC``; a concurrent fork+exec leaked the descriptor into the child.
* Fixed a build failure for ``FUSE_USE_VERSION`` 312 and newer without symbol
  versioning, where ``fuse_loop_mt()`` expanded to an undeclared
  ``fuse_loop_mt_312()``.
* Fixed a Clang 21 build failure in ``ST_MTIM_NSEC``.
* Fixed leaks: the pipe when its size cannot be grown, the mountpoint in
  ``fuse_session_mount()`` and ``fuse_session_destroy()``, the pipe
  descriptors when ``fork()`` or ``setsid()`` fail in ``fuse_daemonize()``,
  the context when ``pthread_setspecific()`` fails, ``print_module_help()``,
  and a ``fuse_pollhandle`` in ``fuse_lib_poll()``.
* Examples: ``update_fs()`` uses ``localtime_r()``. ``localtime()`` returns a
  shared static ``struct tm``, so it raced with the session threads and
  ``strftime()`` could format a half-overwritten time.
* Examples: ``cuse_client`` caps the transfer size at 16 MiB. ``do_rw()``
  passed the SIZE argument straight to ``calloc()``.
* Examples: memfs_ll locking, refcounting and bounds fixes, including a
  use-after-free on rename overwrite and on a concurrent forget.
* Examples: passthrough_hp lock-order and lifetime fixes. The directory
  stream is protected by a per-handle lock, ``fs.mutex`` is taken before
  ``Inode::m`` and when ``link()`` raises nlookup, and no inode lock is held
  across a syscall or a reply.

Documentation
-------------

* The fuse-devel mailing list moved to lists.linux.dev.
* Man page and README corrections.

The following people have contributed code to this release:

Abhinav Agarwal <abhinavagarwal1996@gmail.com>
Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
Ashish Ahuja <shivashish.ahuja@gmail.com>
Benjamin Peterson <benjamin@python.org>
Bernd Schubert <bernd@bsbernd.com>
Darrick J. Wong <djwong@kernel.org>
Jan Engelhardt <jengelh@inai.de>
Jingbo Xu <jefflexu@linux.alibaba.com>
Keerthana KT <keerthana@labs.digiscrypt.com>
Mikhail Novosyolov <m.novosyolov@rosa.ru>
Miklos Szeredi <mszeredi@redhat.com>
Robert Doebbelin <robert@quobyte.com>
nikola-sh <nikola-sh@narod.ru>
wangrzneu <wangrzneu@gmail.com>
wilkis <marvin+github@alruno.eu>

(a full list of credits containing all known contributors is included in
the `AUTHORS` file).

Best,
-Bernd
