Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E76367F31
	for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 08:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776933895; cv=pass; b=owx+bcDw4+GayeZA00mzv9LgcQ3ntr5B/az60L9fQeJPLBm7niQ7nN9647Zx8c5TktiIkCIibQmi7rdX862QnSrTzK+0vT2jLIhdVazUMDE4NJ9CgoWxc0hkEWt2BAQF5SFuNqb5nsMCzAujhJ6BlCdeHNvZgovXQO8tdewzn0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776933895; c=relaxed/simple;
	bh=BkHQvLayOxx925RpqmFBcGRh5pDK2pwDTGlSpcMw9yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuzDKgeyqjWeuoeKTmZnH+wNMtrfzMLdOBtFTQcrjk+p0V54sHGTHhZCwBQmE/dFBVCBUa49liCywW1me3foQXSrvVyNl7+dtjDbidfGdZzGtaF6ryK+X/++oo0MkWCPLcUxKAmO90/wMqdA8oBRp3JRA/T8PInJPBO+aCWcQIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6xYWWfd; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6xYWWfd"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so896230166b.2
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 01:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776933893; cv=none;
        d=google.com; s=arc-20240605;
        b=CuGBNoXQLNrSddOlIoLY3hKoWuO++bENzdBfGkjY5bv4B2Szy/SgKanMK40p8LWNDy
         gIXCxV2Jw6YN70UJKbAeQy3tXmTL+MAZq1wfgq4Za1YdKN8Qoqb0Jh+h9m0bTmm5puxz
         exl8hz5K1MaibdvMAD2/+Zfq/bZok6RX+2CJti7NNsMOnVUapHspJmRKWbbl3T79M2qU
         m5UI01UuKfgx6cp+ArAqJONXoFGKceNxxIfE4XvjprG57C3+2uW9US0VQRI8v5T0aLee
         e6LspN3bYhyrObFmreDomEv2+PYvug8J38Q2eme6XnThkku+r7Sa3wFXVLrSjXwbpTLZ
         jJiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cr2DxCftNoLGV0XgJFquO+Wug9SkaXdAg2c0Mitnj8A=;
        fh=7lERYvE0E5agO8wP3DF7jLUoezTF82RfnNrj2VW3OkI=;
        b=MrvxTmUboI9rO/a50HL9z6s1De7dWCrk/NVdG62pJd5d+onWulkddWlqqZKWy1PgLM
         wyRmFbt031c1QN7TypNZKO7wUW6CE/87muM49Cujq1sW+ArIAmyZ3UZ4dnf5rrWmSl+Z
         bbEj3rk/K4IxR2kiClxHvSfoOAaKOGEjR/b3yj8SFnMlYPWSZhB3wfwkqLTC3LfQQ9go
         t8H2gltl2R1IxZJwcPp7ExW1IftemFralZTFD7wAg5dcStgKQhtfr4xMQ1bvG6d2lADk
         Cw9QVbsVgQztbMMUhOrxWT5umRgYQQm9VRPH31ivtSAsLv6k592F6ygmFAXN/oWkAJII
         zneA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776933893; x=1777538693; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cr2DxCftNoLGV0XgJFquO+Wug9SkaXdAg2c0Mitnj8A=;
        b=Z6xYWWfdgDbo5RQ+EBqimQOIALE4H0OQxTZs3V0T1WiMIt1dn2rW8IqLAss0kDOaPb
         jmTRZTa/BtulGEQTC7Ntrtly5QOZP80rgjvRIBOkxFA5YNZrS2hGdkdlEgSmT+NP5YZB
         2iLBMTZ+djKx56iaoNaTx/CjPLNVLXHyGsana3HL5aXuVbOpU1TBzQOkkxxmDDdvmfY/
         xSAmk8UVTUY/DxtRyJSM/hJDMMoO6c3WB9yRS/UMGRlAH2dRLgqaFrvXb1c1IZQp7RLw
         l/w9tMbuaZAkoBKZgWJWYYaTgCognHTN/mEdZ6ouG5Z057de0SeTP1qgMQo6/KfFizgc
         dQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776933893; x=1777538693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cr2DxCftNoLGV0XgJFquO+Wug9SkaXdAg2c0Mitnj8A=;
        b=I1mHiP5q810tCB6ltmeyMq9MFhtrLoiZuSf1wDJlaSO6m+3l2N0TD6cygSnQozYzaR
         3apZzBPV46NVFtyRoL5yN9T4TDnobzPIzwZddaOHvU1UoWNjOx0EdO9Kl6IAQEOPA5y1
         In4//VKnEQR9DRzjJ7VFxk/lnJnnoUCW+fC0ZON02gV21FQQMqXOGiC/nKM1IPV2xua+
         Ih2vt8S0hzlwU5OoUlpsf3cPV8I9WWQMxteFgCImOETJKP4xr16ifZCoTPwx4TUMJ/aI
         TRm77482JAuvqGvaPSQDQ5Ayfvw7wwOSpcs1VBhEqJNKRJUqoyxVwf37SjphUaptypND
         F9tg==
X-Forwarded-Encrypted: i=1; AFNElJ9sVyaKfpKss5mMdW4rUoHWzViqKcbxFWIOPJ7sdlqVd/TTyc3c7chP4C6v2fmZg/2hxrIH0yO3Po8H@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0sjd06Iv/LMls5OXL5Hn8SMSxL8UWoxCMyT863lm2m2Ei8IQA
	qaZSjPnP1ILKDR30ODn17bSHZNAxfeTpPky7owoyyNWeWTQ5vJEqhJZvxjIaXLqFYdsqd8Jt8RT
	s39I2b7KQSsxrlIXSF6r7JKA/Yir0Ud0=
X-Gm-Gg: AeBDieuzeokcyHE0rKZIGexqbBqCoHERAauh125U7IDt2s/wJPBPaiU01puAVn/xgWL
	pFuDpbqfsJRlTSUcq40EZBUkATa3159dPPkz+6y+jxWtpFN4FH+ev4HeAw8egczoT8u5T9DkLbx
	eVlIvSWl8tqalsNShxeRMY/kG6ipv6A/02fw37/GdjxagSkYMd1is42H3iI1r+wgU8iJr649xVa
	aRHPW1Y6vljiFddFIY4ErvjnfdMQGQlkw1PxKmrSc5hHF38OH69rikYg71RcGGlKQpvVt+ktvc4
	Z2r3lMIbWaw9oV+0SkiKipqYWXd3yKb8lKG7i7aQNp6+mWJdHVu3
X-Received: by 2002:a17:907:970a:b0:ba7:9885:b56e with SMTP id
 a640c23a62f3a-ba79885ba4amr816855366b.20.1776933882752; Thu, 23 Apr 2026
 01:44:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260422231518.GA7717@frogsfrogsfrogs>
In-Reply-To: <20260422231518.GA7717@frogsfrogsfrogs>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 23 Apr 2026 10:44:31 +0200
X-Gm-Features: AQROBzDxnRHLctVJUca6bIp8OO4TE6wlUznX6wKwx0EA_yNWOAIcr1mgvh7h0ws
Message-ID: <CAOQ4uxhEmbFWuM80F+Tq7TbDWjrL-znkwu=O=P7Ng2P5dksXsg@mail.gmail.com>
Subject: Re: [PATCHBOMB v5] fuse/libfuse/e2fsprogs/etc: containerize ext4 for
 safer operation
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-ext4 <linux-ext4@vger.kernel.org>, 
	fuse-devel <fuse-devel@lists.linux.dev>, Miklos Szeredi <miklos@szeredi.hu>, 
	Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Neal Gompa <neal@gompa.dev>, Christian Brauner <brauner@kernel.org>, 
	demiobenour@gmail.com, Naoki MATSUMOTO <m.naoki9911@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 1:15=E2=80=AFAM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> Hi everyone,
>
> This *would have been* the eight public draft of the gigantic patchset
> to connect the Linux fuse driver to fs-iomap for regular file IO
> operations to and from files whose contents persist to locally attached
> storage devices.
>
> However, the previous submission was too large, and I didn't even send
> half the patches!  I have therefore split the work into two sections.
> This first section covers setting up fuse servers to run as contained
> systemd services; I previously sent only the libfuse changes, without
> any of the surrounding pieces.  Now I'm ready to send them all.
>
> To summarize this patchbomb: fuse servers can now run as non-root users,
> with no privilege, no access to the network or hardware, etc.  The only
> connection to the outside is an ephemeral AF_UNIX socket.  The process
> on the other end is a helper program that acquires resources and calls
> fsmount().
>
> Why would you want to do that?  Most filesystem drivers are seriously
> vulnerable to metadata parsing attacks, as syzbot has shown repeatedly
> over almost a decade of its existence.  Faulty code can lead to total
> kernel compromise, and I think there's a very strong incentive to move
> all that parsing out to userspace where we can containerize the fuse
> server process.  Runtime filesystem metadata parsing is no longer a
> privileged (=3D=3D risky) operation.
>
> The consequences of a crashed driver is a dead mount, instead of a
> crashed or corrupt OS kernel.
>
> Note that contained fuse filesystem servers are no faster than regular
> fuse.  The redesign of the fuse IO path via iomap will be the subject of
> the second patchbomb.  The containerization code only requires changes
> to libfuse and is ready to go today.
>
> Since the seventh submission, I have made the following changes:
>
> 1) Added a couple of simple fuse service drivers to the example code
>
> 2) Adapted fuservicemount to be runnable as a setuid program so that
> unprivileged users can start up a containerized filesystem driver
>
> 3) Fixed some endianness handling errors in the socket protocol between
> the new mount helper and the fuse server
>
> 4) Added a high level fuse_main function so that fuse servers that use
> the high level api can containerize without a total rewrite
>
> 5) Adapted mount.fuse to call the new mount helper code so that mount -t
> fuse.XXX can try to start up a contained server
>
> 6) Cleaned up a lot of cppcheck complaints and refactored a bunch of
> repetitious code
>
> 7) Started using codex to try to find bugs and security problems with
> the new mount helper
>
> There are a few unanswered questions:
>
> a. How to integrate with the SYNC_INIT patches that Bernd is working on
> merging into libfuse
>
> b. If /any/ of the new fsopen/fsconfig/fsmount/move_mount calls fail,
> do we fall back to the old mount syscall?  Even after printing errors?
>
> c. Are there any Linux systems where some inetd implementation can
> actually handle AF_UNIX sockets?  Does it make sense to try to do the
> service isolation without the convenience of systemd directives?

A large part of the world is running container workloads on kubernetes
and my understanding is that k8s does not mix well with systemd.

We have successfully used the fusetmount3-proxy [1] approach by Naoki
MATSUMOTO as a way for unprivileged containers to delegate fuse mount
by a (non-systemd) service, running in another container.

[1] https://github.com/pfnet-research/meta-fuse-csi-plugin#fusermount3-prox=
y-modified-fusermount3-approach

The README says that sshfs, s3fs and other high profile fuse fs have been
tested with this approach and they do not require any rebuild.

So it bears the question...

>
> d. meson/autoconf/cmake are a pain to deal with, hopefully the changes I
> made are correct
>
> I have also converted a handful more fuse servers (fat, exfat, iso,
> http) to the new service architecture so that I can run a (virtual)
> Debian system with EFI completely off of containerized fuse servers.
> These will be sent at the end.
>

... what is the added value of rebuilding those packages with systemd
service support?

I am not implying that there is no added value, I just am not well versed
in the world of container and system services.

Thanks,
Amir.
