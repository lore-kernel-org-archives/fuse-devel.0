Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F78369204
	for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 21:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782424491; cv=pass; b=TA2pSbmfFaifMip8vRhwVIDb/a7UJqx60BGEEItTmUPGc8PPnGu/uSS6v36KFP8qvp3ZNkrAtDUmZEGxVYIvs5hSaNPbSI+extTHWSEtdjwlRV/KKOteQ6Rb/noWnSozQwJ65CzYf1sjkiUm8Yndf2WLWvzfbFzDvqE7YI+QW0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782424491; c=relaxed/simple;
	bh=hqP0C+GrCPLuEUi4frPBPhU5bZ7odll3YOOBeZVlniE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oOVoMNoaNVHKwBQhPh95AlDvkpzgX5rTaP82vcW/ClAQq7lQh4zCoZZyCGqnsHuptEVKcfprioIAmxxMzwy+rod7f7Zv7OtUVUEvqTfZPJ/svEvShjePr8SnTYu733luybTm3OzDJYyjVVA5vEk088PiQdpUE19sKlNvopzaz/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoXa90iV; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoXa90iV"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-46e4764ca48so231075f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 14:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782424489; cv=none;
        d=google.com; s=arc-20260327;
        b=n4y/376AOp8ytxz5yq83ZArjxnhDmh8KD7sVpdnjmm9z/deIBu7P0d2481Rg6qSocn
         lWOUTlUIXCf0uTZK79TR4oFTlMt3OeI8V415n7me3zlN6C0vH5w+VEVDjFn4HMDt4AHL
         c08j6L3hSTjo7rcJ/F3FM4BhuZ1dN1Nsbsp28kxvI/0fQNOoEjLpdkltxqA1iUbaZ+r3
         LjYw3VY+/d+DvBJMbxYQXXdWwo486Y+cX/FS726aXKbCd5C25Eew+uB5+c1FHptdMmL/
         Ft78oFPnXEPEbz0J2VRH+K1Lmdp8nT60YL7iPKdMTfHwmATyHiLpJwakYMx4bQ89ZpH6
         i5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hqP0C+GrCPLuEUi4frPBPhU5bZ7odll3YOOBeZVlniE=;
        fh=QiizwqUNUvrDDA1UgBXr+r3ldU2TgNtslepvGak7KWA=;
        b=TndEkZtJy0KTFBWOPocvhH+BwWB9iPP7B1e4zmBr/JDG6z0rrd426YaH0fsXk15kU0
         dGmlsdwde4ChcVxGhxHUkylFfhpM0ECMj+uiSXEofHyEU8QDID9iyJ904ASQ84XkS65e
         USOjuF9pkKlSVStsLOJ5V+23ipwNi7J5ZiX6RMzSxou7+2qnoRL1kM8qvmfC+CbNkNRC
         K6YDpRWZTtFK7ClbC7Wy5FJhJlCOGfEJZiPfBJHowLcEpDhlXo4chx66bn2G+v2kSJVM
         +sSDbBN3ZsHGjO9ZlrF38rMvERoSulnDMOBTZ8fWh4Z73uzbfKipmJjo9OUlaI4EvtRx
         gnig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424489; x=1783029289; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqP0C+GrCPLuEUi4frPBPhU5bZ7odll3YOOBeZVlniE=;
        b=EoXa90iV3mxLHC7qOzEkK8YktIEw+7NbFBGWFJigyAwjv1NnUw33iNJ5NSroISA7ZG
         6hKGR8Lp2ga8yY9vBv8Ay0R/FWmGdSQg1ZrnRJBwf9/wH60iyJYRZ8PzaWdGPPU2Se2e
         nKAfPsERo9UmoxNk11l3Oa9Eux5FWa6UsDePU89H1XJDXZ6TXlCAePA6K86q9vDcyqZ5
         Te8jtx9vEvW/5kfJGwLma4jcCGeok6FISqLkAib3t2zqCbJR7IZIT6+8/mzR2dNLBrRy
         Ex1O4EXB7s2s8NofFIiVZ5qsOSJX5TDKnWyU5HX45ioIUfRAzwDq2FMZnIa8mTvcpt39
         aHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424489; x=1783029289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hqP0C+GrCPLuEUi4frPBPhU5bZ7odll3YOOBeZVlniE=;
        b=FNsNpVrnETX/F5txrjVDPCbu61/wYKFxYe22j5DgJfC0fTJa2KkZz+xYcqzGd1uMM2
         lhLbs3Z5KEI3aOMCvGpdAMHod806QlvP0bP5EnSK9CwkcCl4deeamjuhzrq4Wee9SDio
         8n3elV9jESmx2XK/QQwNB+C0r5ZjMSnA5Pxa7hsJd60bb0fGvRfV4qhocBt97ijZC81o
         DFWlmycHHtUEH/jDTJrqh474HtNVi9EHrS2pyfdWMPk5QX3jpjXjuwKi6fan2ZpUMigN
         JdUyZSxVD9RgYuvd7BMbgmwbkQhObO0ogRoYd9nUdHR/IcF58TPO5KJoai0/Z8kiJxaB
         +5FQ==
X-Forwarded-Encrypted: i=1; AHgh+Rphhut00A8qXxS9/Y6Z4d50QL7uG2lz91iwv8Wdd0aWLUIid3D3f5GJ2iOdaQJce36u2H6t4XyMKO0K@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu+RFVMR5TkMLmS5bLZlKkiw1rTyW1/Kl9m3kO/gGoGkE/m95k
	yjFbDpP3JmYeuCqOTgS9E2PIWaB0iQ5D7N8OUp6nwD4HALlxwWOfwU9HG0J2Cnr7XSEJpAQmYmS
	6dbeU3evuJ+HpBHe97NxuQEdqhuZCJ4I=
X-Gm-Gg: AfdE7cmP6ayH56ANtSBznr19AbuNvQTCSeQPqJDajcJ0HLAhnvvuGIgiKrxqp1rLZ6U
	w9MLXeAGCdFy/v+Yb4NP3TcwmZmEgqQZ08GJH2RehUrTOAjJ/3J54OiTu63Ov52BGuMJHrQGtN9
	wLTGBPkF+6c4YsDeHAb1+1dVDH6n3YDuxiDJL2HGE53VCOZMwRIlKWF6317Nk8VCLF8LXdc5fiP
	oTT/hgbOi15T+VTuCofivaGPw6zRwFRdfYATytj6pfSZ6Hq5BUzyUnqjOcstmd296BwGSc/0T+Z
	VXJf0vR5kZjpqGMLUw6ekIlaE6eO27pSGO+t9vzFY6LH3ovsrI99
X-Received: by 2002:a05:6000:3109:b0:46e:6684:4665 with SMTP id
 ffacd0b85a97d-46e66844690mr3903048f8f.4.1782424488674; Thu, 25 Jun 2026
 14:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624212925.1668662-1-joannelkoong@gmail.com> <20260625-zeilen-allein-beimessen-2f631e840538@brauner>
In-Reply-To: <20260625-zeilen-allein-beimessen-2f631e840538@brauner>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 25 Jun 2026 14:54:37 -0700
X-Gm-Features: AVVi8CdgcDeH4L7ba7ny6GntgJ_zpXfkq2R6ExpkAUsTrggKSXyXk2XE0Qy7MbI
Message-ID: <CAJnrk1Ypq2r+xofROACMRJ_QTtAJC1wJueNg4uCvnpDnWyYLXQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] iomap: add helper to keep uptodate bitmap in sync
To: Christian Brauner <brauner@kernel.org>
Cc: willy@infradead.org, hch@lst.de, djwong@kernel.org, miklos@szeredi.hu, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 12:46=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
>
> > This series is on top of the main linux tree [1] because it depends on =
some
> > fuse changes in Miklos's tree that were merged into 7.2 but not yet pul=
led
> > into Christian's vfs tree.
>
> So I pushed out vfs-7.3.iomap based on current mainline. It'll be
> rebased once -rc1 is out ofc but so you've got something to base things
> one.

Thanks, Christian! I'll base v3 on vfs-7.3.iomap
