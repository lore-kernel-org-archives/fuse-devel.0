Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DFB37C0F0
	for <fuse-devel@lists.linux.dev>; Wed,  8 Jul 2026 21:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547356; cv=pass; b=UHkVWbs3R3Rx4n6+VhbhYHXbjQeWaZKfyYs6bvnVhYXGINvXngzW4hoI4fTW4MOxvzCPTKHHfU496UxssDKWbf914h34IEyqDmGF2EqbLxwfzu4MY+nvNwHQdnlrax9dwJ2AfOlc5gc8dzzq4JFG6kjdYiBuqxGxg/GtYtPoZg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547356; c=relaxed/simple;
	bh=kW39Ysv0VDGIVvAcr+8aBygFDx1j2L9mcscxDiOiJ1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKuPF1Cu9iuGOXULXimbu2/EPY22QwDPuxpFVsO3Dt22RerYGRHNTUnFzQUgpn93qFHvH9g+aJSEaAhGJWQqUZE14wefZlcLrEzHQcrSUz3h1Mp2qIuo3uXAKkUyBFmz5Elc19/oKsyhCnMHMw91DANq8v4z6lqn7BuiKnDeppg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvSNJRM2; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvSNJRM2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso5634825e9.0
        for <fuse-devel@lists.linux.dev>; Wed, 08 Jul 2026 14:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783547353; cv=none;
        d=google.com; s=arc-20260327;
        b=acrc1WmbePq2z/tQR4oyc5N6WafchYn2jOaxiUikCaEuxg1xihphHA7KW/DN7tgrOY
         UaE6DPL5k9rmUTsITKtsKYKA7x0zdR4t2cTIP7NiLcAOzvfWMQNec/NuuoDfFzL4+mbW
         pmZKTm3YvSSGV+J3Dd7dR7XaS4G9fiPxaq84wHK66kbJVfq3tWNO8LwSqWOqoWlW17Hu
         I4cqHmKf6ZXOZTTg/7nQC8s1KiiKdgOh9wMrA0EkNukjycMnPBWJ067IKSwe9+/ecc6Y
         XDJ6EEkaAXP/Q4H03UEkF6Uzra9EdM/EJBIJOkWA/L1Km2N4kOYc8RQuftT5H4WKVDZc
         kJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qkuoYBqKk5lyGV++UZy74kJgGza4SOcuN6HeQmJYDys=;
        fh=5vY8lFZxcxV11KcOWX0pfC687c1H/X9huqzE7I1bM4U=;
        b=o4E85jZcERijgccHZjzU56OgK874XYIR7RYZpvXO5pLX6IJ/oZMkEVK9OgeRdqvWkV
         VYZhVvVScOLp4HyypIcqdmWZs+CUZYxeXXfGmEzxb858x5IOMA5w7K+L3a7Ozo3CFXFr
         iTxJeM1ZlcuIMPiGKMsYx1Z7QuTygmAqoVlNfnY2sl+lXNSDS4iNPseAoEsNoF+EtiHR
         +bfZhFoAX6YjKEkW9C29p+ovPkQnHqpdY8726M5ONCF6xfc8Umco3aUxcT0KCXFOJREJ
         f9AJI2KMfImmAtar0VLc/rNPs+q/LtYdjBa58Ihk0VWscF07CvtJoyUNOtDjr4R5l7Xl
         g1kA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783547353; x=1784152153; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qkuoYBqKk5lyGV++UZy74kJgGza4SOcuN6HeQmJYDys=;
        b=OvSNJRM2IqAs0i0ou4aPqkB/r4FtJ6ueu6LWaok9PDLB1DfcukKRoMsv3KRhsdQNc/
         2Q3kcjvm5nUlQJxuKZQdBbYREnPKgdI4MfmIhCIeiY/JXsZU3USZ1y+3Gu+XN+DmkYtI
         7Zl+rCFdekjOJdvbI/NkXvvT93xFCGW4STeKSKqEGLxxmnZhB18BuKrBPb0nKCzOnB01
         /bk+J1NZseTj1H53jVzVW/aGWbgKgJ0eafm9dh958rko5h5gmlPK2/6zaSs99aBZ9aI8
         jF0Y5vsr1QKTZtOyQ2stiAuaONiRtslFUqKDzMECHR/9u83FySSNYMa4Ip8lztDFbCSk
         kAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783547353; x=1784152153;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkuoYBqKk5lyGV++UZy74kJgGza4SOcuN6HeQmJYDys=;
        b=hHTwyvrk3xRC9yfvta7qJEn9ku+TpH7kyw/YnZkRG8Q4XoXv7cWtOymsFrheTr9OFR
         fz7/NB+5wtKe5JLWa5LyouOM34uSsJywiHfi7glYakLuhvprrT4nE1gvhV8MgEgWtK9B
         xwhydaeNWGadA2UT+dvJIxBGSmkrsy0yVmORg/Fkpj0FW7oM+G0R1/HtbhkmOd6stM5a
         X4ZEUyTwQf8K+x1GE2JRlEjmDC3J81uXnxUI3aZviVKLScaMTwNlu5hTBSEI1ovjRoE7
         BFzbP7acELGjTS6HTJvxMSmQZ2LnC67QdptbteeMiTcay4hQUuzXySOHLoYhQ33NF3/2
         lXwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAhd0FhLJ9xQncS7hOMsuW45wGXwizFVKVvdRDjHf6zE+GXScGN4d1HNLhHwHEfezvJOcANwO7L5T3@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0k1y+PpT5vVbj4AnanUbwXM+OHQMDlMxzyQEPuO44+cJzFrkm
	qF0bqfzz53LsxZn0W5n9qNp5pYiLbttxXHit7dewZz3O10+AM8NhhOb1RLSeTlelJduiouERNwu
	rdjnc0qOTJ9k+qlesy98nIwKI2SnMMkQ=
X-Gm-Gg: AfdE7cmXEY7PyVWRUGd6TCOEg5NKimCKSc5xk7h5/JIlXOs2q6ljcdYbJcecbOZdsp6
	astDCJFPPez0E4IVjoEJirv3pvo1Z7JHGCz4egK+bEKGb/SYjwNb/gzfNvd+e1sAwdruRZz0t76
	84s8npBaeLRG8MMIomtBKLQz+c9k4SmxXz9fOcMArCfmpZtEsXubgLUzLoExwhUfOgA4G/u6hSA
	4xaIHTPQB6SO+utrID+ZOlvpVJEHtaAx7Ntu0nXS2HHu3OVdsa7yS7fOatkqVTGEveocXpGXRXh
	4IsSb9hV2wfQfXEoWdpShANFuEd9Cj8Z68JicYwzeXgW3dhyzaae
X-Received: by 2002:a05:600c:c174:b0:493:c862:3f2d with SMTP id
 5b1f17b1804b1-493e685992cmr40712775e9.5.1783547353519; Wed, 08 Jul 2026
 14:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708021705.3436-1-liwang@kylinos.cn>
In-Reply-To: <20260708021705.3436-1-liwang@kylinos.cn>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 8 Jul 2026 14:49:00 -0700
X-Gm-Features: AUfX_mx62gA9FFCAc-X4i4tPrdkHOaslxnhzPK4VfYMPdHiWUJ6-T8GJJH5W0CA
Message-ID: <CAJnrk1bhjybFTgdJnxRW7o=+2D9Ahc=xLCfaONsO8P0_e=1rhA@mail.gmail.com>
Subject: Re: [PATCH] fuse: drop redundant err assignments in fuse_dev_do_write()
To: Li Wang <liwang@kylinos.cn>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd@bsbernd.com>, 
	Amir Goldstein <amir73il@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 7:17=E2=80=AFPM Li Wang <liwang@kylinos.cn> wrote:
>
> After fuse_copy_one() succeeds, err is set to -EINVAL before validating
> oh.len. When oh.len equals nbytes, err is already -EINVAL, so the extra
> assignments before the notification and oh.error checks are redundant.
>
> Signed-off-by: Li Wang <liwang@kylinos.cn>
> ---
>  fs/fuse/dev.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 5763a7cd3b37..7813f6214d0e 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1887,7 +1887,6 @@ static ssize_t fuse_dev_do_write(struct fuse_dev *f=
ud,
>                  * Only allow notifications during while the connection i=
s in an
>                  * initialized and connected state
>                  */
> -               err =3D -EINVAL;
>                 if (!fch->initialized || !fch->connected)
>                         goto copy_finish;
>
> @@ -1898,7 +1897,6 @@ static ssize_t fuse_dev_do_write(struct fuse_dev *f=
ud,
>                 goto copy_finish;
>         }
>
> -       err =3D -EINVAL;
>         if (oh.error <=3D -512 || oh.error > 0)
>                 goto copy_finish;
>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
