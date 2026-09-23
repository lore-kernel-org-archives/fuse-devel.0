Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5881D43B3EF
	for <fuse-devel@lists.linux.dev>; Wed, 23 Sep 2026 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155436; cv=pass; b=Kb/l0J2litOxwUn4c6HlsFkBIXx219OD0zNLD+0epHxcmglus3kwqYgSEgUITIE4t20dw+JeRe8Imu3ZSJkeCiLMVMguG9YIMVyuaMvwT1HVZqruCZrEy4KSXmlnArYnjRR0jJzRMHiXvA4KYslkVVH2R4/oJFLG022MEGLaLLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155436; c=relaxed/simple;
	bh=3xEe9ZWG4AtCEMdKNW95DX462BuG6lSlRZEFAMmAnec=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rQdg3tN+/9dKXK7V1DalRwWPdw5VzxsABYGjaIocxW+0tNE1Z2d6LwYXdKN8oQOrWMyzvNFHGXjAxjnShlN8N4VSWMZu2jbTKTZl7TAZedSHvbI1Nwe1mOa+b2vPAGjG5LEc9jvD4aWtp3QoFa6pfZB6aMjF+5nX2csIqvXfyrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKTrG3H6; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKTrG3H6"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa06e51bc3so1169660a12.2
        for <fuse-devel@lists.linux.dev>; Wed, 23 Sep 2026 02:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790155432; cv=none;
        d=google.com; s=arc-20260327;
        b=N3YxXXHMiD44z5U00Qk3bt7DdHOXZJRiaAeqRNmN6cyZqYatts/F37K46C1NOVIohZ
         6tUxnuCnmkVCm0O70lk/b+wrOgWWnt8ghtCKsqoYr1/aMLSiXLTxnHFEOo0TZEhEVdwl
         E//q1dP9o6ACbbb5cSGTaax/UUiuhBRP8GdYE4/ESonAhGokQH+7NlLEbaT2INPKYJxz
         IXwkfECnlc00Bx/wC4DW1Fg2AzQ/Rhw1BBMEkaXGr5O1yGCGvp3evf6OcDEyNYva7Sb1
         kEt0mld3yRLDfbLIc60AY0FhuFPNJQQArg+gGUFVeWLjS0iMqjmW66Dppt/3VBT8AH3q
         1GJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2hLXCXGrUFIrTUGKCgEPiNvPtQcPtRp2BpI6S34RUXI=;
        fh=bUc84UNDkcYOkHCYNDW7prlh/3lzj0+Y+iFBl/jos2o=;
        b=S1JIJK9BESDxCb4kyqIknsU0RCzAwqRnR1xT5tFYpS/icYcG4vmYjB1W3mhKfp61nt
         FGYi7m9cfmXbPCAU/xECZe04KfUa7sONZRqSRIApyz3BGsdQIMNx0hdO03nshdWIqtAU
         spUMFbm6hf8pA+BwrDUiCuKa7NA6RH37ib9RMGmcQClkTbuSBeDFKbMmO1L0f8921oev
         EyspJNhbktSfEdPaL/OfZ8wvZj6w9OrqHkET2L8Xt2iG+3quoAqhcOKhqf6UNJnqaER6
         oymYTYaeGCZ1Tlv5xbZS7X0VynsHQHGiScI8OwZvi677emHWtbZjSACigywReS8AR/Tc
         FHuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790155432; x=1790760232; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hLXCXGrUFIrTUGKCgEPiNvPtQcPtRp2BpI6S34RUXI=;
        b=UKTrG3H6Gmx8ixb0QnTOFM6RURAvrniNMkN9acTMHpHLtUNObjVXn7W7G8Yyp+tANs
         sPwWDTfKdb+SrPkZ1ltHghgvmx898DdlIelm44bGnmBIUY3wrJ6VL7Q9ID73NJeTzaJc
         CD3ITGn7Wn415B1z06rGxgb470McSfkVtkiaFkGzLLx01/aiNk8lJA727KnjQCOFTfIL
         sXVR+J1rPHvf/EmHOz9NeRjNSIh14u8+82OnH00zhcvwIItyLuNJ2hcrQ6I3zchY0iUM
         Vx8Fxkhn/5QKDTsw/HqhmpmR7qMVhM7Pbdn2AVXPYulRjKKqB+y8M6HGE7wTouAHkAaB
         745Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790155432; x=1790760232;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2hLXCXGrUFIrTUGKCgEPiNvPtQcPtRp2BpI6S34RUXI=;
        b=2UFdWIKuOi8p8NtkR+iAqt8qXeC8libU3+b4wJToyYh0YA7UGhVH50UwE1BVRKwM1S
         I//tugwrmTvI1eXmJ2u3vkvrQ6187aZ3SizL2mnI2M335lut8rr6u3mjUIkD51Cltm5b
         NhzGbEPRfwdjBazRB12xBATx5fIRFLMce2UZouU0mHyuEadGgm6PWLteMPngSxQ82jSX
         eHF169oq7aY2sTX+sKTMXea43QGQiHQ1zslJeLAfG8+cjvBE7IOsCz2jWSZ9i2WMUu9m
         l3RLuHMblBRfz+ESWp/n0jvJYZkZ62I15ro2iTQYZVR1KWXbvNoqgNzW3CLhRnbTtRp1
         HMKA==
X-Gm-Message-State: AFuF++kEimiQiN51Res9BX4WVPiPWJzWXh1xqVroaR3KppUfklJJVn9j
	fljc/HInkEEHPPQTq+R4fcWP4iX1boIXFtz2dlbjbf3XE/i1YPH35DElrlPoYtBOr/+m/JGGWla
	rZMA0t4ce2raxKvJbmsN9Ipta4YVP9ayPVysg
X-Gm-Gg: AYBFou1mYCP8zMeRdvbAcD5ecfjKnLMe5L0p15t6ELr5bPi38V/cDDJjoOvZXTr3T/P
	DNf0GGHIwzmHsaXvGxgaas9T8Fn3rItEjy+am7QqYCcNjVPQp/6J8G7f1NKdlytlVjCtCOzixSK
	5pqAnGzibl7NhcF3V3+BqTP8cI9SFB6ejw5T0wAxdyilHt7Q66e45m6bfz36CdOL+zYaT3M1zU2
	2JUwC2wtXE7+WaWMParW7fC8aDXV3wGbFpzEG6h+DoUMSEQzvLEt6n9K2/TzEWEwZrfs0O2pJjL
	wjjMc6USV8aHiEUw+oLYu93L9TSDyPaPQeQ0MTw2umHfgwxFZW9Pz2qa
X-Received: by 2002:a05:6402:2547:b0:6a7:fa18:3a47 with SMTP id
 4fb4d7f45d1cf-6aab3b05d24mr1797571a12.12.1790155432351; Wed, 23 Sep 2026
 02:23:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mitar <mmitar@gmail.com>
Date: Wed, 23 Sep 2026 11:23:40 +0200
X-Gm-Features: AclHuK_XsSSnSwpJLnw4jYOz28Ykgi_x6JWCChZzbweTHAhiQ07yDfXaHqqbXVI
Message-ID: <CAKLmikMHpPdXmyPMPhad=wc_HerzCv3wEtp4s-E+NrjvuHj3pA@mail.gmail.com>
Subject: [RFC] fuse: temporarily detaching a passthrough backing file
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi!

I am writing a FUSE filesystem which stages what a command writes in
layers, so that the changes can be reviewed before they land on disk,
and I have been looking at whether FUSE_PASSTHROUGH can serve its data
path.  It cannot, and the reason seems general enough to ask about
here rather than work around locally.

Once FOPEN_PASSTHROUGH has been granted for an open file, the server
cannot take it back.  FUSE_DEV_IOC_BACKING_CLOSE removes the id from
fc->backing_files_map and drops one reference (fuse_backing_close() in
fs/fuse/backing.c), while each open file keeps the reference it took
in fuse_passthrough_open(), released only when the file is closed.
None of the FUSE_NOTIFY_* messages reach it.  Granting passthrough is
therefore a promise that the backing file stays the correct target for
the entire life of every descriptor which gets it.

There are two situations where a server cannot make that promise.

1) Quiescing, to make a consistent copy.  A server which snapshots,
backs up, or tiers the files it serves needs, at an instant of its
choosing, to stop writes reaching the backing file so that it can copy
it, and then let them continue.  With passthrough the server is not in
the write path, so its copy is torn; fsync does not help, since it
flushes rather than stops writers, and the only remaining option is to
freeze the whole workload from outside the filesystem, with the cgroup
freezer or similar.

2) Re-targeting.  The file which ought to receive writes changes while
descriptors are open: a cache evicting or promoting a file, or a
stacking filesystem redirecting writes to a new layer.

Of the two, (1) seems the more general, and it is the one which does
not depend on any particular stacking design.

What both would need is a way for the server to detach the backing
from the open files holding it, letting io fall back to ordinary
requests, and later to attach a backing again, either the same id or
another one.

The io path looks mechanically simple, because it re-dispatches on
every call: fuse_file_write_iter() reads ff->passthrough per write, so
clearing it would send the next write through the connection.  What I
cannot judge is the rest.  fuse_file_passthrough() is a plain read of
ff->passthrough, so a detach would need something to serialise against
io already in flight, and the io mode transitions in fs/fuse/iomode.c
would have to be driven in both directions: out of uncached io mode on
detach, and back into it on attach, with the page cache invalidated in
between.  The kernel does already perform one such transition at
runtime by itself, when the first mmap of a FOPEN_DIRECT_IO file
enters caching io mode.

mmap is the part I expect to be contentious.  A mapping is bound once:
backing_file_mmap() sets the vma's file and then runs the backing
filesystem's own ->mmap, so the vma ends up with that filesystem's
vm_ops and page tables into its address space, and nothing in the
fault
or writeback path consults the fuse file again.  A detach which
covered only the io path would therefore leave existing mappings
writing to the backing file.

For (1) that is a bounded loss: only a process which mapped that file
MAP_SHARED for writing can still store into it during the copy, so the
copy of that one file may be inconsistent while every other file gets
a clean cut.  overlayfs documents a comparable deviation, in
"Non-standard
behavior" (b) of Documentation/filesystems/overlayfs.rst, where a
lower-layer file mapped MAP_SHARED does not see later changes.  For
(2) it is worse, since the mapping goes on writing to a file which
nothing resolves to any more.

So my questions are:

 - Is an interface of this kind of interest at all, or is "a backing
is forever" meant to be part of the contract, in which case it would
be worth saying so in fuse-passthrough.rst?

 - If it is of interest, would a detach which explicitly does not
affect existing mappings be acceptable, documented the way overlayfs
documents its deviation?  Or would mappings have to be handled, by
walking the backing inode's i_mmap, zapping and re-pointing the vmas,
for such an interface to be considered at all?

 - What shape would be preferred: an ioctl beside
FUSE_DEV_IOC_BACKING_OPEN and _CLOSE taking a backing_id, a
FUSE_NOTIFY_* message on the connection, or something keyed by nodeid
rather than by backing_id?

 - Is there an existing way to get either of the two behaviours which
I have missed?

Code references checked against 7.3-rc5.


Mitar

-- 
https://mitar.tnode.com/
https://noc.social/@mitar
https://bsky.app/profile/mitar.bsky.social
