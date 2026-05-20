Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB25935BDB2
	for <fuse-devel@lists.linux.dev>; Wed, 20 May 2026 19:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779306939; cv=pass; b=BUeMzk7C0R9T0BEAj1oykJROe118Cedt/EMy7qyOSxMRjxDHTeOnM338Tw0c8n1DUKpBGOeAHVKgPi3RYIHE361RsaH+PqCAqbfpK+c0XJKsKJDHIOCjY1dmR/OWbjV0KaNfy1PFZlk+GVbk+fvp1ZUXVS4NgDOyElc4zQit+0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779306939; c=relaxed/simple;
	bh=9Q34cFVQWLWAAn/q3aUqVa8EHeIay+4M9jAXGYL1/Tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJDfWvb3X7M/1Ruf5QMK8MG2vpDsvFVkLw8I0BmexFT6ss0P6UyXUae/CKL+XHXJS1DGyNxuEv2d9zF9O8g1eVxK633CvAJ5YGJwth+aIvw4CLs6+rgt6zPoBHhc6/65GJIAAkzXbdLyILRrG5lB2JUQMR1jOaPzBqzzvuKAWeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtwqEJ+s; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtwqEJ+s"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so8974446a12.1
        for <fuse-devel@lists.linux.dev>; Wed, 20 May 2026 12:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779306936; cv=none;
        d=google.com; s=arc-20240605;
        b=GVQqDjLc3+FqsbMF5a2Z9s/VJYWdAGFQ7HupQYmPWXhi/PBOGO6Sx6fECFvwVBxikl
         JV2e7jpjmLfpjkmt0Lrdls6taTVDierrgTvqgLbrBYnA96/H5oCbnmyBGiVFzoMdVtNW
         PwDtfho1rExpTfa1+5DtcEY55eAWSkoaia5d/7gdPY67HyW6wsyYnCYaxtmAnYtWA6PJ
         V400gyUvWh8qNBcv+50mAe25D5oSSSWfnsrn/cjLEHymwwOjeB6Kak3Vefnihhpxtpqb
         ZnIEFUEumJlLZGvAu5D2QJxOZq9yEYDUukLURD6eXwI1owIDtPtucn6XFCt370HUje0A
         R50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Q34cFVQWLWAAn/q3aUqVa8EHeIay+4M9jAXGYL1/Tw=;
        fh=S0G0NCCp6ybMo1ZxVhVYgA1P/H20KiK6NLMYdVioelY=;
        b=T0NdIKfoaqPPqzn6iMBAYLwBqV2kMKI9lBaQwGjJTnXlt1kosLaW6N77cKaudiDHPA
         pzR/5aoLOJ4PLHc3HucsoE7fCwKKR6w/qgM/ITDiu4Ud/tcvRmwXwG8eXk4S3K/S4Hrt
         8v3RqzTjuV1BC8tT5USochYyfliQ43q5hcKK9D5+4Cl4cvpY6244oIoGwmPxfdX8LegV
         6Kw4yGVhSKS7PQbSrlACKMglDS3BRFMkyZEpTIOniqTWgdeR489aer3uOISScV4HHZMx
         JaGeEa9lo/nP3P600gjA2PhKHhi060lZYi4Amtvgd7BJsxzFge4qoLkvz5T2sV8tQgUM
         UKWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779306936; x=1779911736; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Q34cFVQWLWAAn/q3aUqVa8EHeIay+4M9jAXGYL1/Tw=;
        b=HtwqEJ+sVx7MLXlUb0iNYFv7tIMx3pILoyHZTuq4j7hyRsgtEdC1TdZtbxiGiDiUXq
         heR+stAsRgCGR2UkAz7ZcxY8wXZcik7LiceWTjvs1eLjLKNmXDqWM10Ia/h2vLVHjwdR
         xBFGk7nGpovK8aAFIJfWJbh8j8zULWiSc1jYmGoFgeeoOUpRiHDsK/US+mg08T2uUCTK
         Cet308HTEZWPNE/8OG3gTPKdJO17qfr454NlNnMfZfAG5jVVLkyfN6P2f7vtK2Sm8DbM
         iDtyUDMHpzRqt4YPhg1XviEn12oZ/nQ9l4WbC9JbqsspzqKtIab+K9yg+kJed0puF+Kw
         Zptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779306936; x=1779911736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Q34cFVQWLWAAn/q3aUqVa8EHeIay+4M9jAXGYL1/Tw=;
        b=YH23Meb/cV1BEwK5zrB10L4J232Zy4J2+8pdUcnjb9+ke+2OgfOU8yYpkk372TKm9y
         i8wvX+hYk2u5kcGU8FH8+4Y7YXIc2jHb/Bz0D4nn5Ux3Uabm/pzBd4CYtBiRxUoKCgAK
         WAM/rHfkEIQeDW6tje1zqmoWcafjzt3DlAl+IDlQvtVHyCAFeOafLxFZi15N7Xamnz8y
         beH8jzHuWvH6Ay+Jf3f5cjqZ+RgXbKL0OxoW8ONB79rKBwihPb+c5S9zolkmoZH5HLPQ
         7HYDUQ9i86MLH4bX5eWlBu0s7NmZPeQolDkSt2WCDTx1eF7doH2fJoiTNyUSVmJnXsoJ
         /xmA==
X-Forwarded-Encrypted: i=1; AFNElJ+jxhDkKW5vR+S6OuYvKxuUI1DXT1O6pDZe5vm05fKs/8TF7R3KDQtf4qhMLuj6XskUBw2Zzh+sUjWs@lists.linux.dev
X-Gm-Message-State: AOJu0YyI3ktpo7oXYJnChqZrTv9BNK4Kz6cz/k0epoIooS5yfVPBvOEX
	4lX7GDJtiS8BC+pCap/nFEgE5WRfGvoHWGXHpTtaBazsY0DGgljLbm0GLhfZrI1xVSvcHmx4JhK
	lgIo3fWVKRjN+yOT2CO0HHK3qVAC/YG8=
X-Gm-Gg: Acq92OFhoObK5ua6gSFRRR/fN+EW+zQQyF5/LUfDWddW7NjKA07IcURyBpS/VS7Dd30
	EpMVhZEaA/a7cbGEf2ELSXUEVh+gdmFCRo8/h+lUNMm3zIkNHBHla408O6IRHnQ2Qw1zYt5fF3U
	MpqFh7sdMaRob/Utt9dmj4EDfv2vFsyEP+13pdAoh8pcH/tRq730AfQTLPXEoekZ36Xehfh6M5c
	bd2x/Wbl4dI4K+i4UHOANmUr1wNU2GyDqLmaF8xjXGmiDDS983VVOjK/WMrZX3J/VnUAtAcas2x
	x3NODtS2XMwr5xXN7Hnnlj6nDBTjL9gONZBNQJEZ0A==
X-Received: by 2002:a05:6402:24ce:b0:674:5b2c:d42c with SMTP id
 4fb4d7f45d1cf-683bc4b1262mr11201124a12.3.1779306936107; Wed, 20 May 2026
 12:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177922944800.2436629.7011047808676668088.stgit@frogsfrogsfrogs> <177922944866.2436629.1081840703046716342.stgit@frogsfrogsfrogs>
In-Reply-To: <177922944866.2436629.1081840703046716342.stgit@frogsfrogsfrogs>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 20 May 2026 21:55:24 +0200
X-Gm-Features: AVHnY4IDRYedZ1G4VMH0xqPAsGnqhnK5ihLw1HmufQQj4kZHRWeB9bEo9aat1HI
Message-ID: <CAOQ4uxgnJbbTBup7UDh4R0AStx5hL0DYY09Fk7g9ETJehopMmA@mail.gmail.com>
Subject: Re: [PATCH 2/4] fuse: store backing id in fuse_backing objects
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, neal@gompa.dev, 
	bernd@bsbernd.com, joannelkoong@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 12:28=E2=80=AFAM Darrick J. Wong <djwong@kernel.org=
> wrote:
>
> From: Darrick J. Wong <djwong@kernel.org>
>
> Make fuse_backing objects know their own id, it'll make tracing and
> recovery of backing ids easier later on.

The problem is that in the context of fuse passthrough
backing_id is just a temporary integer name of a fuse_backing object,
but fuse_backing may outlive its backing_id (e.g. in fuse_inode_backing()
and in extreme recycle situation a backing_id can be reassigned a new
fuse_backing while the old fuse_backing object is still alive.

This only makes sense if backing devs ids are never closed, so maybe
only if FUSE_IOMAP and FUSE_PASSTHROUGH are mutually
exclusive (did we do that??) and FUSE_IOMAP never closes backing ids.

Thanks,
Amir.
