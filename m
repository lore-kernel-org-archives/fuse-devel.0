Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA993BAD99
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779715; cv=pass; b=Q3G86RmGqBjZaOv8B6+Eu/i+maQicuaspuy6zr3qGPDybk+Gs2Y2kEvvzoCCJcAktplGiOsTfUT0GIHnVrYUotVY6NfWJ/zqKRiybyGqY9gS4QcscM1MoA9iJPls3fAaiK9MSe8ApiseRui4by2egZl5prjJl9eABcVOiqqyHfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779715; c=relaxed/simple;
	bh=Sp6KUpDRlW467bhvMeECjaPzGeVv96xe03upKN/hSlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDZyDSGYBAcFhtgs3S1PuCdV377wYzNdzBhQc2nXTHLXeH/3c93Wln4SnLVPhMtfDKnh9w48bRD1A2qwYK3nK4qQHxn5Laq5hm8XsCA7K2d4IjX6YS/zonHM7wj3OfYorxea6UU5Ce14vG+3q6xOUc33RgUgYb9DeaHTlWLaK40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrWzkcce; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrWzkcce"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ba8472c1613so330832966b.0
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 06:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776779712; cv=none;
        d=google.com; s=arc-20240605;
        b=dVZNWgZxe0MhN4OxtWiJijsMVtBgj/V4GNCYNZHUKD8uhsknbuxZocT+p6XCin8c2v
         EOuJ78l3u0mdq/mXCKbuxm0PMQr1Mg4/kdPidH5jDnHED/KkNY6jiB+LIPSGCJH4bFdJ
         LqpwcNr2v/tCpVhZ0X35QkZq8EgYNdoHZg0WqVh5nrqf8Kav1fMMiB7fxBKFm3u1epgt
         D24QPDoHDHK0jtO0eAqucEcWyX1gxpn9PyAXwLbisw2XTkeSZXh78DHJSKigFLcM0DhZ
         4RfETcjoRDMkQgml3oTNnpElMsEXzOzo8BkISqxhFBqBZFP+jedk/eDWC5n+o2mNMlP0
         dr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sp6KUpDRlW467bhvMeECjaPzGeVv96xe03upKN/hSlU=;
        fh=IaDudz5E3MocioHXapaTEURr7OQmxQoRbhS5i+Ds57Q=;
        b=FD57xxYgzHichIw+3UtHAGlfh0sYO1rx6+sIuJd7BzRXVsoVHVVjffjFeFqx5f3d4a
         gCH9Gh1ARE6Wp5Ite2bcKSeIYLM6xXZb5QJs/IJLpem+EZXf3iak7Ot3djjNYk8oD7mm
         2754oBrlul/0n7l4tv5NVg6q9TyffOkjuF+TedpGAE7AXAysPyJh5gLTPy+FaVWPZGti
         HSqDG7SfSwXcNS9cw7F6tnfgx5yX/098kGOtle8JiBWyZoDsF8tUkpsIrKn80vC6sGDC
         0LWVdrZWRwmTN3+OsI2M5RJlsJ8wFloO4hl+W9GyQYs+WYHletUXFSvZ5F1PuRSVonyV
         TYjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776779712; x=1777384512; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sp6KUpDRlW467bhvMeECjaPzGeVv96xe03upKN/hSlU=;
        b=WrWzkcceXdvCGASG49m/kYAGj/hagOkL9S9MXMgoT6YpzYKMQTDSjIulIWc7nrdCo0
         AE1Ue+f0aMqykQECO2/LRq/mdSBdmGR07nu2o/fHEMYRl7vJxn+dTA1JizPIKqaaVk0g
         g/VrKfR72g1R6bxJDEEDo+YCuzVaJlNVvQ9cbkl+GkeLoKCJYSu3J0TXYs5Z9GaIjeii
         E1pNaUmkGB8pIZEYMIE/bXj530kZzOD5OdXSBeuohRVmJ8Z6euQ4lt8860amGeJuCo1k
         fDz1lh9vl/JZibT6wTrVhsVvPN80A7vLcyWUkiGJY27MRwTGvk83LniEtN4H13rpHTi4
         k/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779712; x=1777384512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sp6KUpDRlW467bhvMeECjaPzGeVv96xe03upKN/hSlU=;
        b=LO9prRDxzDMWentj6O3AtyT2HOgu7ywUnNVbUF8Btj7ArplwM4DPJoO3ryNAOx/zgq
         r8m7v18QRfkF7lIjy7vYz7zZW6Ay+BEENje3X2c8SVGwynXVIssc3l+jEjraFo6v8k4D
         gvE4KWUm+UyrN5R/NlF0U/MWaYBfXevbxzci9/8yvhnUbobvcnpDhjRMD5w+zbNsyVjc
         SLaSrSf52hHE9m6VkN5+fQ4Ncg9fipwKPjW+CTl3jS/uSuRihH34IkMvNLK1BLpwSobC
         taWEZR1m+khfQ6yTA0uS9LhsS9/v8x8ddecpZq+olEjljoU+XvIaaKP8d+H+2Bf7BCJJ
         /c7w==
X-Forwarded-Encrypted: i=1; AFNElJ/5Hq+VPbqgwk2t+Yj2G8uO71UgI8zGK+4yFnIpfoO6eIIWZzLDkoTZn03zD8bZZiU6uqynTlRzTTWf@lists.linux.dev
X-Gm-Message-State: AOJu0YyvmPMDqWEeB6KDHzXMW/eXvH0y0A7Grd0dXA/qUWcn98KVrCtR
	6c58lS/1uO9ssD7a39h1FXoEL6GnnVZE2vWI3PlxapLDjy8hQq66DvGfhsB2HWAm1NOyXyggAZB
	Sdn7Wi+a1rrnP75LTQOnklEAxvCgUQgw=
X-Gm-Gg: AeBDievtbF/+syaaP4laaQdwwsJ5n67hsSE1eEnRX7ca/DpT+Nxs4qN8eKtHfxEpAm/
	nRtQ8n9MDXflBO8W3BbtNe4CBQs6wBrb6wEQ4i520jcPoU4e6zbv95KMsdhlC/uIJjQAXH3pem2
	CR5XB4gzK4tGXBtBUCaYVdXY8sPZfGYj6kQBw2iXSxrdf79FOZWlN0wsJ9KOEjcFl3MZiVtnD03
	2YGOvWgc9aienTZhyMejsgIw208ir2pggNQjvZuqHXFjI+kWRfKcfsyTBDAe7Taz9Bmv4Ud6MNv
	IatsmmTuLVenwtIqZlav020tiFwyV2ubPMOy/LqizYVDkr5Ls/c4
X-Received: by 2002:a17:906:fe45:b0:ba5:7cce:979f with SMTP id
 a640c23a62f3a-ba57cce99dbmr620745166b.40.1776779712124; Tue, 21 Apr 2026
 06:55:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com> <CAOQ4uxhbR8AoBCUMYQntAHzo_1wjh=Qcpb1z0CE4ynfDE-ZAFQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxhbR8AoBCUMYQntAHzo_1wjh=Qcpb1z0CE4ynfDE-ZAFQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Apr 2026 15:55:00 +0200
X-Gm-Features: AQROBzCXC5Xt7f4OzjAPzwuaJDry_vF2B7goie58X49DXJED1eltQpCr8bPON1c
Message-ID: <CAOQ4uxhVnzoka4QppUvmFmq3wtXSU_ahgpkNR==Gbnpm5hpUyw@mail.gmail.com>
Subject: Re: [PATCH v1 00/17] fuse: extend passthrough to inode operations
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 11:37=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail=
.com> wrote:
> >
> > This series extends fuse passthrough to support inode operations (getat=
tr,
> > setattr), directory readdir, and kernel-initiated open on backing files=
.
> >
> > The existing FUSE_PASSTHROUGH mode attaches a backing file to a fuse in=
ode
> > only when a passthrough file is open. This series introduces
> > FUSE_PASSTHROUGH_INO, a stricter mode requiring one-to-one inode number
> > mapping, which allows attaching a backing file for the lifetime of the =
fuse
> > inode.
> >
> > Future work includes passthrough for additional operations (rename, unl=
ink,
> > readdirplus) and full subtree passthrough, which will be part of a sepa=
rate
> > series.

Joanne,

Thanks a lot for picking up my abandoned wip!

Could you add a few words about the intended use case in Meta?

Is the target fuse filesystem expected to be used by arbitrary users/apps
or by a controlled set of users/apps where a posix_fadvise() may make
sense to configure readdir vs. readdirplus?

What is the minimal set of passthrough ops that would make this useful
to your internal customers? Is readdirplus in this set?

Do you have profiling numbers to indicate which ops generate the most
overhead for would-be passthrough ops routed to the server for the
target workloads?
And how do these numbers improve when using io_uring channel?

Regarding "full subtree passthrough", what does that mean?
That lookup op itself is passthrough?

In that case, would there be no way to escape (opt-out of) passthrough
inside the subtree?

The semantics sound challenging especially when considering
moves of directories in and out of subtrees.

Anyway, no wrong answers here, just trying to understand the
first mile store you are aiming at and the expected improvement.

Thanks,
Amir.
