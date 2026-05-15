Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F77B405C36
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 21:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778880240; cv=pass; b=QYts/5X7nQeO6VOvGqXwwH41dBwyEgu6o2UB5ypEgKR0T/6H9SxXHqRzWNF9HWRYLnWR1llLVVLuZ7VaHbVRxlXu0h4jziVZhlNtX8tanDAhZKNqpoB209fCLiPFq/o+vrzrtZIoMCdvkmxSPs5gZVaq1uuABprIxpoZDHQhv6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778880240; c=relaxed/simple;
	bh=Ciax+KscSHd+KM1eU71himblbHXGWQL8PXc1xnvj7EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPmbiIaRMp27vGLMgooPJyxxqmF+Z6vEbuVQMDsIfPdJUJBakAFvSlqfuNqMQBSUxZtu/2laBZhHaKHIsoPMLy4xafwfXZpEP7FT0qW9ihzJpbbHoqw5sjkkFHYflPjjjrKc8PYK7h5gbEE9v+qaubPE8AS57DZ6wbXYlL8fbuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRsXVovy; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRsXVovy"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67929ff6dbfso552576a12.2
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 14:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778880238; cv=none;
        d=google.com; s=arc-20240605;
        b=C9kfiOk3uEGmVYonTjxJVn8IjVfv34/kOfY7n9lrwV1I1Ay40jDc0CJh8nt7L5ZqmH
         K+IEE42OiF9Ui93tcmVEBvsoM0SnI6evBoqEV5epgzGnENJSiRqhUJkLrOAgujXWDXLG
         I4AKdZIm6xVnzidkNrF0AXAjQt/Q+nEn/KwhYvuUv/AwOyFC6ajCg1ZxqOQJhBtylnEn
         TTxfKo56CWfpr2X0tfsai+3TYUC8ntVmC23mavryWZTnqybGNeZpNcPghtHK9qGyuChr
         PqmqbXfiRVUs4GD0FjqtTLppOBjpYe5U9RjpeP41f22Ipfu99nlvUj1M320Qp4sI9eYf
         134A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ciax+KscSHd+KM1eU71himblbHXGWQL8PXc1xnvj7EE=;
        fh=bixlf9Dx6gvLZmtS5B2OsNCXK1UV73LPuGFGsgNtYtE=;
        b=F6OG2kWx1XVCDDyfscTdV+Exbi350KQRpXX21ywvAuLSM3xtFepEFSvk7rF3Ikn6Hv
         ZEjTHjGWR2E7a8bHDUwZwwIrJzQf17iDgQ8xy9TiZ+Tuwyk+ncwwfNwZE1QyTTVBuBYR
         bRlUwj8sAFls+x+w1e+kBZOs6vzmGUbEI6ASrEHeF0vaeXMqB8gPQRhRJ6FoFtx+f/P1
         A6MSOdT1z9sizZnxM2JH2YCC0TH+vcrhwH7NXazGPRUUS5bHweIS1hLBeLJtg+4ho3v6
         qVCr1W/MyxUxQh1D90bhVk33UmWBdfLczldDWlRhrKHB3kzi6FlukzRoFna/zjKgaN7L
         hW8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778880238; x=1779485038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ciax+KscSHd+KM1eU71himblbHXGWQL8PXc1xnvj7EE=;
        b=nRsXVovydc1ae/TTtfk9ELdHAu0JM0oE5qYTQ3RGlVC0328yhAZ3AiMbgEeYZPplW+
         DMh0WExqfWByPdZk49SvOwXeVSEJQoewTCKpAsuqlfFqEcg5qUTpC/5b/0c+akmtuedT
         5eh8eUAGlgG0UQG8kJd8NmLIehbpW661v42qGePQVoAamxOPNdg7VwkErqUX66GBvopD
         sRRky5SUT23urVqPNQCf1Jik+83xoY7I1bL9gTkiDfU1nvkREhC9b6jmc7wvu67RN74H
         7SgArr0lP+afVw74+rz9rRAK9DYIEja+GiIT1Rz3kceyln3z9C/+fwa/EV8w17szPq3k
         JQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778880238; x=1779485038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ciax+KscSHd+KM1eU71himblbHXGWQL8PXc1xnvj7EE=;
        b=RBcSaf5tP9wroylbFEmoVAhKdh0rutPW/Bp4HyA7cqQpxuTSSnRHLN7z23HrjoYCZY
         9hKg0TbhL2dz0EyMk9lRa6OAnZbsbZwqx2SJ+5FHzizoIAwXct1RA+K3b4aRt2K90PT0
         U/zcJ8570FRmO8A4venIgxZ18XUhU4vauzB2kO/SZSN60DwMMN93ja3+sUJVn+NiBN42
         TxIew5h/igvqCakEUFBGEohYOiao4x9yi4av+uFBocGqm6pTJixNervrlClPQscgsxKN
         mEo9LiQUXH/pk1tto7a6CjIqhNAzOQYAj8sBd6bBQvzkFwrX9vLUTbTX5h/o50QOTBQK
         yhZw==
X-Forwarded-Encrypted: i=1; AFNElJ89juvKzatqmKdkBFjDnssAo3ZOR10Y6be8811QURwGGGXHJc/KJfRYRjaSni4CN/NZ42ypI622s+i7@lists.linux.dev
X-Gm-Message-State: AOJu0YxReXoBHpELMCltWn1hxFe+Fc8vBoyJYBlSntpI89LsCG1hfvfY
	C0y94uDzIuZTbZSnciPp9EnDDiFn5n9w603gQ8iFWJS3+wtZxlyNtLfVl6e0lCEJYQ6tYtDUPV5
	tRbJxU0XKp9pPToOu4fwClZJqLMJqnUY=
X-Gm-Gg: Acq92OGU6mzgeEhk6+hCx4YJu4Hl13jUVpm9OIfa+kEMJI5WPqGOfDOu/VvCmuCKZtN
	5Lg6MOHb+3ZSWBTxL5Bbw+Gf61zFCF6lzr/L0FJD+cpb7HEe6Q/pq5colePiPgb2W5cwk0skPT1
	6dSLFXZIQlYIs4LzZfKhqMIJqB+kHriKVKcmK+zYFa9Q9ZWyPARvHlqd4VixjouV4ck46Lnp4Z6
	CeGJmFbF/i3MR4dNsiuzlraB7cAqpYlsotUuvrZaFq4b2YTYyy9siuFfITgaM9fwC29xAJVK+94
	jUfN51aGLMbhQKAZ1P88VGEoO/dzZElPUFFVb9yM829SISI5uMYy
X-Received: by 2002:a05:6402:5306:b0:66d:d0c1:f87b with SMTP id
 4fb4d7f45d1cf-683bc8ac52cmr2612530a12.10.1778880237485; Fri, 15 May 2026
 14:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177747206436.4103309.9048553717124547447.stgit@frogsfrogsfrogs>
 <177747206595.4103309.11659424316192000821.stgit@frogsfrogsfrogs> <20260514221632.GK9544@frogsfrogsfrogs>
In-Reply-To: <20260514221632.GK9544@frogsfrogsfrogs>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 15 May 2026 23:23:46 +0200
X-Gm-Features: AVHnY4JvsEFYf6nuy33M9KsI0NCjzPcVO0uuSRahvxqaFc0lU0CExhl8ulhxrAs
Message-ID: <CAOQ4uxh48-LP3pq0HmaF8DKC6rf7+F35rL_K5K0uEg+c-CHNpA@mail.gmail.com>
Subject: Re: [PATCH 5/9] fuse: cache atime when in iomap mode
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, joannelkoong@gmail.com, neal@gompa.dev, 
	linux-fsdevel@vger.kernel.org, bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 12:16=E2=80=AFAM Darrick J. Wong <djwong@kernel.org=
> wrote:
>
> On Wed, Apr 29, 2026 at 07:34:22AM -0700, Darrick J. Wong wrote:
> > From: Darrick J. Wong <djwong@kernel.org>
> >
> > When we're running in iomap mode, allow the kernel to cache the access
> > timestamp to further reduce the number of roundtrips to the fuse server=
.
> >

This sounds like an optimization that could benefit other non iomap
servers as well.

Specifically, if the server tells the kernel (who knows in which response)
that the inode is NOATIME, then kernel could cache the atime value.

Thanks,
Amir.
